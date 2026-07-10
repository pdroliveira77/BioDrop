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

    func buscarPontos(
        latitude: Double,
        longitude: Double
    ) async throws -> [PontoColeta]
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

        let (data, _) = try await URLSession.shared.data(for: request)

        let retorno = try JSONDecoder().decode(
            RespostaOverpass.self,
            from: data
        )

        return retorno.elementos.compactMap { elemento -> PontoColeta? in

            let latitude = elemento.latitude ?? elemento.centro?.latitude
            let longitude = elemento.longitude ?? elemento.centro?.longitude

            guard
                let latitude,
                let longitude
            else {
                return nil
            }

            return PontoColeta(
                id: elemento.id, endereco: elemento, coordenada: <#T##CLLocationCoordinate2D#>
                nome: elemento.tags?.nome ?? "Ponto de coleta",
                coordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                )
            )
        }
    }
}
