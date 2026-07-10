//
//  PerfilModel.swift
//  BioDrop
//
//  Created by pedro on 10/07/26.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable
{
    let id = UUID()
    let titulo: String
    let icone: String
    let exibirChevron: Bool
    let opcaoSelecionada: OpcoesMenu
}

enum OpcoesMenu
{
    case perfil
    case privacidadeSeguranca
    case centralAjuda
    case sair
    
    var corFundo: Color
    {
        switch self
        {
        case .sair:
            return .vermelhoEscuro
        default :
            return .neutraEscura
        }
    }
}
