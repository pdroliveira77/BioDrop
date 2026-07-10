//
//  PerfilViewModel.swift
//  BioDrop
//
//  Created by pedro on 10/07/26.
//

import SwiftUI
import FirebaseAuth
import Combine

final class PerfilViewModel: ObservableObject
{
    let itens: [MenuItem]
    
    init()
    {
        self.itens = Self.criarItensMenu()
    }
    
    private static func criarItensMenu() -> [MenuItem]
    {
        [
            MenuItem(titulo: "Editar Perfil",
                     icone: "person",
                     exibirChevron: true,
                     opcaoSelecionada: .perfil),
            MenuItem(titulo: "Privacidade e Segurança",
                     icone: "shield.pattern.checkered",
                     exibirChevron: true,
                     opcaoSelecionada: .privacidadeSeguranca),
            MenuItem(titulo: "Central de Ajuda",
                     icone: "questionmark.circle",
                     exibirChevron: true,
                     opcaoSelecionada: .centralAjuda),
            MenuItem(titulo: "Sair",
                     icone: "iphone.and.arrow.right.outward",
                     exibirChevron: false,
                     opcaoSelecionada: .sair,)
        ]
    }
    
    func selecionar(_ item: MenuItem)
    {
        switch item.opcaoSelecionada
        {
        case .perfil:
            print("perfil")
        case .privacidadeSeguranca:
            print("seguranca")
        case .centralAjuda:
            print("ajuda")
        case .sair:
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
}
