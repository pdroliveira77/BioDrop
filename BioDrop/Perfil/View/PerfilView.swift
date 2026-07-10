//
//  PerfilView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct PerfilView: View
{
    @ObservedObject var viewModel: PerfilViewModel
    @Binding var abaSelecionada: AbaSelecionada
    
    var body: some View
    {
        ZStack
        {
            GradientePadrao()
            VStack
            {
                VStack
                {
                    ForEach(viewModel.itens)
                    {
                        item in
   
                        BotaoComImagem(item: item,
                                       corFundo: item.opcaoSelecionada.corFundo)
                        {
                            viewModel.selecionar(item)
                        }
                    }
                    .padding()
                }
                
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
    PerfilView(viewModel: PerfilViewModel(),
               abaSelecionada: .constant(.perfil))
}
