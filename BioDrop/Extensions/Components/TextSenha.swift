//
//  TextSenha.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import SwiftUI

struct TextSenha: View
{
    @Binding var senha: String
    @State private var esconderSenha = true
    
    var onEsqueciMinhaSenha: (() -> Void)?
    var isExibirEsqueciSenha = true
    var titulo = "SENHA"
    var placeholder = "Digite sua senha"
    var descricaoIcone = "lock"
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(self.titulo)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                if isExibirEsqueciSenha
                {
                    Button("Esqueci minha senha")
                    {
                        onEsqueciMinhaSenha?()
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primariaEscura.opacity(0.9))
                }
            }

            HStack
            {
                Image(systemName: self.descricaoIcone)
                    .foregroundStyle(.secondary)

                Group
                {
                    if esconderSenha
                    {
                        SecureField(
                            self.placeholder,
                            text: $senha
                        )
                    }
                    else
                    {
                        TextField(
                            self.placeholder,
                            text: $senha
                        )
                    }
                }
                .foregroundStyle(.black)

                Button
                {
                    esconderSenha.toggle()
                }
                label:
                {
                    Image(systemName: esconderSenha ? "eye" : "eye.slash")
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .frame(height: 56)
            .background(Color.white.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        
    }
}

#Preview {
    TextSenha(senha: .constant("1234"), isExibirEsqueciSenha: true)
}
