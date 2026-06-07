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
        .padding(.top, 12)
        .padding(.bottom, 24)
        .background(.ultraThinMaterial)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 24,
                topTrailingRadius: 24
            ))
        .overlay
        {
            UnevenRoundedRectangle(
                topLeadingRadius: 24,
                topTrailingRadius: 24
            )
                .stroke(.white.opacity(0.3), lineWidth: 1)
        }
        .shadow(
            color: .black.opacity(0.1),
            radius: 10,
            y: 4
        )
    }
}

#Preview
{
    BottomNavigation()
}
