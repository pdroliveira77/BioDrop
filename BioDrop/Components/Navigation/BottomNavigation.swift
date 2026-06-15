//
//  BottomNavigation.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 05/06/26.
//

import SwiftUI

struct BottomNavigation: View
{
    var body: some View
    {
        HStack
        {
            Spacer()
            
            BotaoBottomNavigation(titulo: "Home",
                                  icone: "house",
                                  selecionado: true,
                                  acao: {})

            Spacer()

            BotaoBottomNavigation(titulo: "Mapa",
                                  icone: "map",
                                  selecionado: false,
                                  acao: {})

            Spacer()

            BotaoBottomNavigation(titulo: "Perfil",
                                  icone: "person",
                                  selecionado: false,
                                  acao: {})
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.primariaEscura.opacity(0.09))
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .overlay
        {
            RoundedRectangle(cornerRadius: 24)
            .stroke(Color.primariaEscura.opacity(0.15), lineWidth: 1)
        }
        .shadow(
            color: Color.primariaEscura.opacity(0.25),
            radius: 15,
            y: 6
        )
    }
}

#Preview
{
    BottomNavigation()
}
