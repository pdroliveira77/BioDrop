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
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        {
            mensagemAlerta = "Informe seu e-mail."
            exibirAlerta = true
            return
        }

        if senha.isEmpty
        {
            mensagemAlerta = "Informe sua senha."
            exibirAlerta = true
            return
        }
        
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
                    self.mensagemAlerta = self.tratarErroLogin(erro)
                    self.exibirAlerta = true
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
    
    private func tratarErroLogin(_ erro: Error) -> String
    {
        guard let codigo = AuthErrorCode(
            rawValue: (erro as NSError).code
        ) else
        {
            return erro.localizedDescription
        }

        switch codigo
        {
        case .invalidEmail:
            return "Informe um e-mail válido."

        case .wrongPassword:
            return "Usuário ou senha inválidos."

        case .invalidCredential:
            return "Usuário ou senha inválidos."

        case .userNotFound:
            return "Nenhuma conta encontrada para este e-mail."

        case .emailAlreadyInUse:
            return "Já existe uma conta cadastrada com este e-mail."

        case .weakPassword:
            return "A senha deve possuir pelo menos 6 caracteres."

        case .networkError:
            return "Verifique sua conexão com a internet."

        default:
            return "Ocorreu um erro inesperado. Tente novamente."
        }
    }
}
