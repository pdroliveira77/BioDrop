//
//  BotaoEntrar.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import SwiftUI

struct BotaoEntrar: View
{
    var titulo = "Entrar"
    let acao: () -> Void
    
    var body: some View
    {
        Button(action: acao)
        {
            Text(self.titulo)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    LinearGradient(
                        colors:
                        [
                            Color.green.opacity(0.6),
                            Color.primariaEscura,
                            Color.primariaEscura
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .shadow(
            color: Color.primariaEscura.opacity(0.2),
            radius: 10,
            y: 6
        )
    }
}

#Preview
{
    BotaoEntrar(acao: {})
}
