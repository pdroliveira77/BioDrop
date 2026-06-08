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
    @Published var mensagemAlerta = ""
    @Published var exibirAlerta = false

    func login()
    {
        AuthService.shared.login(email: email,senha: senha)
        {
            resultado in
            DispatchQueue.main.async
            {
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
    
    func redefinirSenha()
    {
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        {
            mensagemAlerta = "Preencha o e-mail para recuperar sua senha."
            exibirAlerta = true
            return
        }
        
        AuthService.shared.redefinirSenha(
            email: email
        )
        { resultado in

            DispatchQueue.main.async
            {
                switch resultado
                {
                case .success:
                    self.mensagemAlerta =
                    """
                    Enviamos um e-mail de recuperação \
                    para sua conta!
                    """
                    
                    self.exibirAlerta = true
                    print("Email enviado!")
                    
                case .failure(let erro):
                    self.mensagemAlerta = erro.localizedDescription
                    self.exibirAlerta = true
                }
            }
        }
    }
}
