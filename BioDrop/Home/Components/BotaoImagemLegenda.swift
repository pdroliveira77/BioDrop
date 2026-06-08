//
//  BotaoImagemLegenda.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 08/06/26.
//

import SwiftUI

struct BotaoImagemLegenda: View
{
    let titulo: String
    let icone: String
    let acao: () -> Void

    var body: some View
    {
        Button(action: acao)
        {
            VStack(spacing: 12)
            {
                HStack
                {
                    Image(systemName: icone)
                        .font(.title2)
                        .foregroundStyle(Color.primariaEscura)
                        .frame(width: 44, height: 44)
                        .background(
                            Color.primaria.opacity(0.15)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                }

                HStack
                {
                    Text(titulo)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                }
            }
            .padding()
            .frame(width: 165)
            .background(Color.terciariaTransparente.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BotaoImagemLegenda(titulo: "Ver pontos próximos", icone: "arrow.3.trianglepath", acao: {})
}
