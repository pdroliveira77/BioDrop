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
    @Published var confirmacaoSenha = ""
    @Published var exibirAlerta = false
    @Published var mensagemAlerta = ""
    @Published var cadastroRealizado = false
    
    func criarConta(onSuccess: @escaping () -> Void)
    {
        if !self.verificarSenhasCompativeis() { return }
        
        AuthService.shared.criarConta(
            email: email,
            senha: senha)
        { resultado in

            DispatchQueue.main.async
            {
                switch resultado
                {
                case .success(_):
                    
                    self.cadastroRealizado = true
                    self.mensagemAlerta =
                    """
                    Conta criada com sucesso!

                    Agora você já pode entrar no BioDrop.
                    """
                    self.exibirAlerta = true
                    
                case .failure(let erro):
                    if let erro = erro as NSError?
                    {
                        switch erro.code
                        {
                        case AuthErrorCode.invalidEmail.rawValue:
                            
                            self.mensagemAlerta =
                            "Digite um e-mail válido."
                            
                        case AuthErrorCode.emailAlreadyInUse.rawValue:
                            
                            self.mensagemAlerta =
                            "Este e-mail já está sendo utilizado."
                            
                        case AuthErrorCode.weakPassword.rawValue:
                            
                            self.mensagemAlerta =
                            "Sua senha deve ter pelo menos 6 caracteres."
                            
                        default:
                            
                            self.mensagemAlerta =
                            "Não foi possível criar sua conta."
                        }
                        self.exibirAlerta = true
                    }
                }
            }
        }
    }
    
    func verificarSenhasCompativeis() -> Bool
    {
        if senha != confirmacaoSenha
        {
            self.mensagemAlerta = "As senhas informadas não coincidem. Verifique e tente novamente."
            self.exibirAlerta = true
            return false
        }
        return true
    }
}
