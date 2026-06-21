//
//  HomeView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 05/06/26.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View
{
    @Binding var abaSelecionada: AbaSelecionada
    
    var porcentagemSemanaAnterior = ""
    var dicaDia = ""
    var diasSeguidos = 0
    
    private var corDestaque: Color
    {
        diasSeguidos < 4 ? .orange.opacity(0.9) : Color.vermelhoEscuro
    }
    
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            GradientePadrao()
            
            ScrollView(.vertical, showsIndicators: false)
            {
                VStack
                {
                    ImagemBoasVindas()
                    
                    HStack
                    {
                        BotaoImagemLegenda(titulo: "Solicitar \nretirada",
                                           icone: "arrow.3.trianglepath",
                                           acao: {})
                        
                        Spacer()
                        
                        BotaoImagemLegenda(titulo: "Ver pontos próximos",
                                           icone: "mappin.and.ellipse",
                                           acao: {})
                    }
                    .padding(12)
                    
                    VStack
                    {
                        HStack
                        {
                            VStack(alignment: .leading)
                            {
                                Text("Impacto Semanal")
                                    .font(.headline.bold())
                                    .foregroundStyle(Color.primariaEscura)
                                
                                Text("Seu progresso nos últimos 7 dias")
                                    .font(.subheadline)
                            }
                            
                            Text("\(porcentagemSemanaAnterior)% vs. anterior")
                                .padding()
                                .background(Color.primariaClara)
                                .clipShape(.capsule)
                                .foregroundStyle(Color.primariaEscura)
                                .font(.footnote)
                        }
                        
                        Divider()
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                        
                        HStack(alignment: .center)
                        {
                            TextoQuantidadeColeta(tipoColeta: "Plástico",
                                                  quantidadeColeta: "100g")
                            .padding()
                            
                            Divider()
                                .frame(width: 1, height: 40)
                            
                            TextoQuantidadeColeta(tipoColeta: "Vidro",
                                                  quantidadeColeta: "500g")
                            .padding()
                            
                            Divider()
                                .frame(width: 1, height: 40)
                            
                            TextoQuantidadeColeta(tipoColeta: "Papel",
                                                  quantidadeColeta: "3Kg")
                            .padding()
                        }
                    }
                    .padding(12)
                    .background(Color.neutraMuitoClara.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    HStack
                    {
                        VStack
                        {
                            Text("Dica do dia")
                                .font(.title3)
                            
                            Text(dicaDia)
                                .font(.subheadline)
                        }
                        .padding()
                        .background(Color.neutraMuitoClara.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Spacer()
                        
                        VStack(spacing: 5)
                        {
                            Image(systemName: diasSeguidos < 4 ? "timer" : "flame")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(corDestaque)
                            
                            Text("\(diasSeguidos)")
                                .font(.largeTitle)
                                .foregroundStyle(corDestaque)
                            
                            Text("Dias seguidos").textCase(.uppercase)
                                .font(.caption)
                                .foregroundStyle(corDestaque)
                        }
                        .padding()
                        .background(diasSeguidos < 4 ? Color.yellow.opacity(0.2) : Color.vermelhoClaro)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay
                        {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    corDestaque,
                                    lineWidth: 1
                                )
                        }
                    }
                    .padding(12)
                }
            }
            .padding(.horizontal, 20)
            .safeAreaPadding(.bottom, 120)
            
            BottomNavigation(abaSelecionada: self.abaSelecionada,
                             abrirHome: {abaSelecionada = .home},
                             abrirMapa: {abaSelecionada = .mapa},
                             abrirPerfil: {abaSelecionada = .perfil})
                .padding(20)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeView(abaSelecionada: .constant(.home) , porcentagemSemanaAnterior: "12",
             dicaDia: "Lave bem suas embalagens antes do descarte para facilitar o processo.",
             diasSeguidos: 6)
}
