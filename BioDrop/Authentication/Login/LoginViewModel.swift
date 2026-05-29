//
//  LoginViewModel.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

final class LoginViewModel: ObservableObject
{
    @Published var email = ""
    @Published var senha = ""

    func login()
    {
        AuthService.shared.login(
            email: email,
            senha: senha
        )
        { resultado in

            switch resultado
            {
                case .success(let usuario):

                    print(usuario.email ?? "")

                case .failure(let erro):

                    print(erro.localizedDescription)
            }
        }
    }
}
