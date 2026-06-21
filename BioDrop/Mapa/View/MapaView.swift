//
//  MapaView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct MapaView: View
{
    @Binding var abaSelecionada: AbaSelecionada
    
    var body: some View
    {
        ZStack
        {
            GradientePadrao()
            
            VStack
            {
                Spacer()
                
                BottomNavigation(abaSelecionada: self.abaSelecionada,
                                 abrirHome: {abaSelecionada = .home},
                                 abrirMapa: {abaSelecionada = .mapa},
                                 abrirPerfil: {abaSelecionada = .perfil})
                    .padding(20)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MapaView(abaSelecionada: .constant(.mapa))
}
