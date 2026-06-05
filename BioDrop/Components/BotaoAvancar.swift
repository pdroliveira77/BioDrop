//
//  BotaoAvancar.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 29/05/26.
//

import SwiftUI

struct BotaoAvancar: View
{
    var titulo: String
    var acao: () -> Void

    var body: some View
    {
       Button
       {
           acao()
       }
       label:
       {
           Text(titulo)
               .font(.title2)
               .fontWeight(.bold)
               .foregroundStyle(.white)
               .frame(maxWidth: .infinity)
               .frame(height: 56)
               .background(Color.primaria)
               .clipShape(
                   RoundedRectangle(cornerRadius: 16)
               )
       }
       .shadow(
           color: Color.primariaEscura.opacity(0.2),
           radius: 10,
           y: 6
       )
    }
}

#Preview {
    BotaoAvancar(titulo: "Avançar", acao: {})
}
