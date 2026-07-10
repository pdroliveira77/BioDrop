//
//  BotaoComImagem.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct BotaoComImagem: View
{
    let item: MenuItem
    var corFundo: Color = .neutraEscura
    var action: () -> Void
    
    var body: some View
    {
        Button(action: action)
        {
            HStack
            {
                Image(systemName: item.icone)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(item.titulo)
                    .font(.headline)
                
                Spacer()
                
                if item.exibirChevron
                {
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                }
            }
            .foregroundStyle(corFundo)
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BotaoComImagem(item: MenuItem(titulo: "Perfil",
                                  icone: "person",
                                  exibirChevron: true,
                                  opcaoSelecionada: .perfil),
                   action: {})
}
