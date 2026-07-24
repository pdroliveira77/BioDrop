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
    @State private var pontoSelecionado: PontoColeta?
    
    var body: some View
    {
        ZStack
        {
            GradientePadrao()
            
            Map(position: $viewModel.posicao)
            {
                UserAnnotation()
                ForEach(viewModel.pontosColeta)
                {
                    ponto in

                    Annotation(ponto.nome,
                               coordinate: ponto.coordenada)
                    {
                        Button
                        {
                            pontoSelecionado = ponto
                        }
                        label:
                        {
                            Image(systemName: "leaf.fill")
                                .foregroundStyle(.green)
                                .font(.system(size: 24))
                                .padding(8)
                                .background(.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .mapStyle(.standard(elevation: .flat,
                                pointsOfInterest: .excludingAll,
                                showsTraffic: false))
            
            VStack
            {
                Spacer()
                
                BottomNavigation(abaSelecionada: self.abaSelecionada,
                                 abrirHome: {abaSelecionada = .home},
                                 abrirMapa: {abaSelecionada = .mapa},
                                 abrirPerfil: {abaSelecionada = .perfil})
                    .padding(20)
            }
            
            if viewModel.isLoading
            {
                CarregamentoView(texto: "Carregando pontos de coleta")
            }
        }
        .onAppear
        {
            viewModel.locationManager.solicitarPermissao()
        }
        .sheet(item: $pontoSelecionado)
        {
            ponto in

            DetalhesPontoColetaView(ponto: ponto)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MapaView(abaSelecionada: .constant(.mapa))
}
