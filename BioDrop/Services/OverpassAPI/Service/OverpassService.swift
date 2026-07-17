//
//  OverpassService.swift
//  BioDrop
//
//  Created by pedro on 10/07/26.
//

import Foundation
import CoreLocation

final class OverpassService
{
    func buscarPontos(latitude: Double, longitude: Double) async throws -> [PontoColeta]
    {
        let query = """
        [out:json];
        (
          node["amenity"="recycling"](around:5000,\(latitude),\(longitude));
          way["amenity"="recycling"](around:5000,\(latitude),\(longitude));
          relation["amenity"="recycling"](around:5000,\(latitude),\(longitude));
        );
        out center;
        """

        var request = URLRequest(
            url: URL(string: "https://overpass-api.de/api/interpreter")!
        )

        request.httpMethod = "POST"

        request.setValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField: "Content-Type"
        )

        let body = "data=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"

        request.httpBody = body.data(using: .utf8)

        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code:", httpResponse.statusCode)
        }

        let retorno = try JSONDecoder().decode(
            RespostaOverpass.self,
            from: data
        )

        return retorno.elementos.compactMap { elemento -> PontoColeta? in

            let latitude = elemento.latitude ?? elemento.centro?.latitude
            let longitude = elemento.longitude ?? elemento.centro?.longitude
            let endereco = [
                elemento.tags?.rua,
                elemento.tags?.numero,
                elemento.tags?.bairro,
                elemento.tags?.cidade
            ]
            .compactMap { $0 }
            .joined(separator: ", ")

            guard let latitude, let longitude else { return nil }

            return PontoColeta( id: "osm-\(elemento.id)",
                                nome: elemento.tags?.nome ?? "Ponto de coleta",
                                endereco: endereco,
                                coordenada: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                                materiais: [],
                                horarioFuncionamento: elemento.tags?.horarioFuncionamento,
                                origem: .openStreetMap)
        }
    }
}
