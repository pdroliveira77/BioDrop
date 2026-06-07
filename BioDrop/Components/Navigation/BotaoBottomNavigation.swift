//
//  BotaoBottomNavigation.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 06/06/26.
//

import SwiftUI

struct BotaoBottomNavigation: View
{
    let titulo: String
    let icone: String
    let selecionado: Bool
    let acao: () -> Void
    
    var body: some View
    {
        Button(action: acao)
        {
            VStack(spacing: 4)
            {
                Image(systemName: icone)
                    .tint(selecionado ? .primariaEscura : .gray)

                Text(titulo)
                    .font(.caption)
                    .tint(selecionado ? .primariaEscura : .gray)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 8)
        .background(selecionado ? Color.primariaTransparente : .clear)
        .cornerRadius(10)
    }
}

#Preview {
    BotaoBottomNavigation(titulo: "Home", icone: "house", selecionado: true, acao: {})
}
