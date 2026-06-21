//
//  BottomNavigation.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 05/06/26.
//

import SwiftUI

struct BottomNavigation: View
{
    let abaSelecionada: AbaSelecionada
    let abrirHome: () -> Void
    let abrirMapa: () -> Void
    let abrirPerfil: () -> Void
    
    var body: some View
    {
        HStack
        {
            Spacer()
            
            BotaoBottomNavigation(titulo: "Home",
                                  icone: "house",
                                  selecionado: abaSelecionada == .home,
                                  acao: abrirHome)

            Spacer()

            BotaoBottomNavigation(titulo: "Mapa",
                                  icone: "map",
                                  selecionado: abaSelecionada == .mapa,
                                  acao: abrirMapa)

            Spacer()

            BotaoBottomNavigation(titulo: "Perfil",
                                  icone: "person",
                                  selecionado: abaSelecionada == .perfil,
                                  acao: abrirPerfil)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    LinearGradient(
                        colors: [
                            .white.opacity(0.4),
                            .white.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        }
        .shadow(
            color: .black.opacity(0.08),
            radius: 20,
            y: 8
        )
    }
}

#Preview
{
    BottomNavigation(abaSelecionada: .perfil, abrirHome: {}, abrirMapa: {}, abrirPerfil: {})
}
