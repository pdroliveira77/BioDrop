//
//  MapaView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI
import MapKit

struct MapaView: View
{
    @StateObject private var viewModel = MapaViewModel()
    @Binding var abaSelecionada: AbaSelecionada
    
    var body: some View
    {
        ZStack
        {
            GradientePadrao()
            
            Map(position: $viewModel.posicao)
            {
                ForEach(viewModel.pontosColeta)
                {
                    ponto in

//                    Marker(
//                        ponto.nome,
//                        coordinate: ponto.coordenada
//                    )
                    Annotation(
                        ponto.nome,
                        coordinate: ponto.coordenada
                    ) {

                        Image(systemName: "leaf.fill")
                            .foregroundStyle(.green)
                    }
                }
            }
            .mapStyle(.standard)
            
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
        .onAppear
        {
            viewModel.locationManager.solicitarPermissao()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MapaView(abaSelecionada: .constant(.mapa))
}
