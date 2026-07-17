//
//  DicaDoDiaView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import SwiftUI

struct DicaDoDiaView: View
{
    let dica: DicaHome

    var body: some View
    {
        VStack(alignment: .leading, spacing: 12)
        {
            HStack
            {
                Image(systemName: dica.tipo.icone)

                Text(dica.tipo.titulo)
                    .font(.headline)

                Spacer()
            }

            Text(dica.titulo)
                .font(.title3.bold())

            Text(dica.descricao)
                .font(.subheadline)
        }
        .padding()
        .background(dica.tipo.cor.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    DicaDoDiaView(dica: DicaHome(id: 1,
                                 tipo: .dica,
                                 titulo: "Caixas longa vida",
                                 descricao: "Embalagens longa vida são recicláveis e podem ser transformadas em novos produtos quando encaminhadas corretamente."))
}
