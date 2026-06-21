//
//  PerfilView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI
import FirebaseAuth

struct PerfilView: View
{
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
                    BotaoComImagem(nomeImagem: "person",
                                   descricaoBotao: "Editar Perfil",
                                   exibirChevron: true)
                    {
                        print("Clicou no editar perfil")
                    }
                    
                    BotaoComImagem(nomeImagem: "shield.pattern.checkered",
                                   descricaoBotao: "Privacidade e Segurança",
                                   exibirChevron: true)
                    {
                        print("Clicou no Privacidade e Segurança")
                    }
                    
                    BotaoComImagem(nomeImagem: "questionmark.circle",
                                   descricaoBotao: "Central de Ajuda",
                                   exibirChevron: true)
                    {
                        print("Clicou no Central de Ajuda")
                    }
                    
                    BotaoComImagem(nomeImagem: "iphone.and.arrow.right.outward",
                                   descricaoBotao: "Sair",
                                   exibirChevron: false,
                                   corFundo: .vermelhoEscuro)
                    {
                        do
                        {
                            try Auth.auth().signOut()
                        }
                        catch
                        {
                            print(error.localizedDescription)
                        }
                    }
                }
                .padding()
                
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
    PerfilView(abaSelecionada: .constant(.perfil))
}
