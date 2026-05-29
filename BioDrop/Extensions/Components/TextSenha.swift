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
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("SENHA")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Button("Esqueci minha senha")
                {
                    
                }
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primariaEscura.opacity(0.9))
            }

            HStack
            {
                Image(systemName: "lock")
                    .foregroundStyle(.secondary)

                Group
                {
                    if esconderSenha
                    {
                        SecureField(
                            "Digite sua senha",
                            text: $senha
                        )
                    }
                    else
                    {
                        TextField(
                            "Digite sua senha",
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
    TextSenha(senha: .constant("1234"))
}
