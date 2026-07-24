//
//  PBHPontoDTO.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import Foundation
import CoreLocation

extension PBHPontoDTO
{
    var materiais: [String]
    {
        tipoMaterialColetado
            .split(separator: ",")
            .map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
    }

    var endereco: String
    {
        var componentes: [String] = []

        if let tipoLogradouro,
           !tipoLogradouro.isEmpty
        {
            componentes.append(tipoLogradouro)
        }

        if let nomeLogradouro,
           !nomeLogradouro.isEmpty
        {
            componentes.append(nomeLogradouro)
        }

        var enderecoCompleto = componentes.joined(separator: " ")

        if let numero = numeroFormatado
        {
            enderecoCompleto += ", \(numero)"
        }

        if let bairro,
           !bairro.isEmpty
        {
            enderecoCompleto += " - \(bairro)"
        }

        return enderecoCompleto
    }

    private var numeroFormatado: String?
    {
        guard let numeroImovel,
              !numeroImovel.isEmpty
        else {
            return nil
        }

        if numeroImovel.hasSuffix(".0")
        {
            return String(numeroImovel.dropLast(2))
        }

        return numeroImovel
    }

    var coordenadaUTM: CoordenadaUTM?
    {
        let texto = geometria
            .replacingOccurrences(of: "POINT", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        let componentes = texto
            .split(separator: " ")
            .compactMap {
                Double($0)
            }

        guard componentes.count == 2
        else {
            return nil
        }

        return CoordenadaUTM(
            easting: componentes[0],
            northing: componentes[1]
        )
    }

    var coordinate: CLLocationCoordinate2D?
    {
        guard let coordenadaUTM
        else {
            return nil
        }

        return ConversorUTM.converter(
            easting: coordenadaUTM.easting,
            northing: coordenadaUTM.northing,
            zona: 23,
            hemisferioNorte: false
        )
    }
    
    func converterParaPontoColeta() -> PontoColeta?
    {
        guard let coordinate else
        {
            return nil
        }

        return PontoColeta(
            id: "pbh-\(idLEV)",
            nome: nome,
            endereco: endereco.capitalized,
            coordenada: coordinate,
            materiais: materiais,
            horarioFuncionamento: horarioFuncionamento?.capitalized,
            origem: .pbh
        )
    }
}

struct CoordenadaUTM
{
    let easting: Double
    let northing: Double
}
