//
//  BotaoComImagem.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct BotaoComImagem: View
{
    var nomeImagem = ""
    var descricaoBotao = ""
    var exibirChevron = true
    var corFundo: Color = .neutraEscura
    var action: () -> Void
    
    var body: some View
    {
        Button(action: action)
        {
            HStack
            {
                Image(systemName: nomeImagem)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(descricaoBotao)
                    .font(.headline)
                
                Spacer()
                
                if exibirChevron
                {
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                }
            }
            .foregroundStyle(corFundo)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BotaoComImagem(nomeImagem: "person", descricaoBotao: "Editar Perfil", exibirChevron: true, action: {})
}
