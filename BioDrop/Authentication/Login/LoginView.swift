//
//  ContentView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/05/26.
//

import SwiftUI

struct LoginView: View
{
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                GradienteLogin()
                    .ignoresSafeArea()
                
                VStack(spacing: 24)
                {
                    Spacer()
                    VStack(spacing: 12)
                    {
                        Logo()

                        Text("Por um futuro mais limpo e sustentável.")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(spacing: 20)
                    {
                        VStack(alignment: .leading, spacing: 8)
                        {
                            TextEmail(email: $viewModel.email)
                        }
                        
                        VStack(alignment: .leading, spacing: 8)
                        {
                            TextSenha(senha: $viewModel.senha,
                                    onEsqueciMinhaSenha:
                                    {
                                        viewModel.redefinirSenha()
                                    })
                        }
                        
                        BotaoEntrar(viewModel: self.viewModel)
                    }
                    .padding(24)
                    .background(
                        .white.opacity(0.55)
                    )
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .overlay
                    {
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(.white.opacity(0.3), lineWidth: 1)
                    }
                    
                    HStack(spacing: 4)
                    {
                        Text("Não tem uma conta?")
                            .foregroundStyle(.secondary)

                        NavigationLink
                        {
                            CadastroView()
                        }
                        label:
                        {
                            Text("Criar conta agora")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primariaEscura)
                        }
                    }
                    .font(.subheadline)

                    Spacer()
                }
                .padding(.horizontal, 24)
            }
            .alert(
                "BioDrop",
                isPresented: $viewModel.exibirAlerta
            )
            {
                Button("OK", role: .cancel)
                {

                }
            }
            message:
            {
                Text(viewModel.mensagemAlerta)
            }
        }
    }
}

#Preview
{
    LoginView()
}
