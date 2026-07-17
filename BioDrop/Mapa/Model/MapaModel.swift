//
//  MapaModel.swift
//  BioDrop
//
//  Created by pedro on 09/07/26.
//

import Foundation
import CoreLocation

struct PontoColeta: Identifiable
{
    let id: String
    let nome: String
    let endereco: String
    let coordenada: CLLocationCoordinate2D
    let materiais: [String]
    let horarioFuncionamento: String?
    let origem: OrigemPontoColeta
}

enum OrigemPontoColeta
{
    case pbh
    case openStreetMap
}
