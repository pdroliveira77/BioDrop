//
//  CadastroViewModel.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

final class CadastroViewModel: ObservableObject
{
    @Published var email = ""
    @Published var senha = ""

    func criarConta(onSuccess: @escaping () -> Void)
    {
        AuthService.shared.criarConta(
            email: email,
            senha: senha)
        { resultado in

            switch resultado
            {
                case .success(let usuario):
                    print("Usuário criado:\(usuario.email ?? "")")
                    onSuccess()

                case .failure(let erro):
                    print(erro.localizedDescription)
            }
        }
    }
}
