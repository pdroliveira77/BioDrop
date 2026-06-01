//
//  CadastroView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 29/05/26.
//

import SwiftUI

struct CadastroView: View
{
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CadastroViewModel()
    
    var body: some View
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
                    
                    Text("Sua jornada sustentavél começa aqui.")
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
                                  isExibirEsqueciSenha: false)
                    }
                    
                    VStack(alignment: .leading, spacing: 8)
                    {
                        TextSenha(senha: $viewModel.confirmacaoSenha,
                                  isExibirEsqueciSenha: false,
                                  titulo: "CONFIRME SUA SENHA",
                                  placeholder: "Digite a senha novamente",
                                  descricaoIcone: "checkmark.shield")
                    }
                    
                    BotaoAvancar(
                        titulo: "Criar Conta"
                    )
                    {
                        viewModel.criarConta
                        {
                            dismiss()
                        }
                    }
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
                    Text("Já tem uma conta?")
                        .foregroundStyle(.secondary)

                    Button("Entrar")
                    {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primariaEscura)
                }
                .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal, 24)
            .alert(
                "BioDrop",
                isPresented: $viewModel.exibirAlerta
            )
            {
                Button("OK")
                {
                    if viewModel.cadastroRealizado
                    {
                        dismiss()
                    }
                }
            }
            message:
            {
                Text(viewModel.mensagemAlerta)
            }
        }
    }
}

#Preview {
    CadastroView()
}
