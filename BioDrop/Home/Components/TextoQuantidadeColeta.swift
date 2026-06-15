//
//  TextoQuantidadeColeta.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 15/06/26.
//

import SwiftUI

struct TextoQuantidadeColeta: View
{
    var tipoColeta = ""
    var quantidadeColeta = ""
    
    var body: some View
    {
        VStack
        {
            Text(tipoColeta.uppercased())
                .fontWeight(.bold)
                .font(.footnote)
            Text(quantidadeColeta)
        }
    }
}

#Preview {
    TextoQuantidadeColeta(tipoColeta: "Plástico", quantidadeColeta: "100g")
}
