//
//  AuthenticationService.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import Foundation
import FirebaseAuth

final class AuthService
{
    static let shared = AuthService()

    private init() {}

    func criarConta(
        email: String,
        senha: String,
        completion: @escaping (Result<User, Error>) -> Void
    )
    {
        Auth.auth().createUser(
            withEmail: email,
            password: senha
        )
        { resultado, erro in

            if let erro = erro
            {
                completion(.failure(erro))
                return
            }

            guard let usuario = resultado?.user else
            {
                return
            }

            completion(.success(usuario))
        }
    }

    func login(
        email: String,
        senha: String,
        completion: @escaping (Result<User, Error>) -> Void
    )
    {
        Auth.auth().signIn(
            withEmail: email,
            password: senha
        )
        { resultado, erro in

            if let erro = erro
            {
                completion(.failure(erro))
                return
            }

            guard let usuario = resultado?.user else
            {
                return
            }

            completion(.success(usuario))
        }
    }
    
    func redefinirSenha(
        email: String,
        completion: @escaping (Result<Void, Error>) -> Void
    )
    {
        Auth.auth().sendPasswordReset(
            withEmail: email
        )
        { erro in

            if let erro = erro
            {
                completion(.failure(erro))
                return
            }

            completion(.success(()))
        }
    }
}
