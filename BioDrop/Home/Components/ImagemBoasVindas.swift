//
//  ImagemBoasVindas.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 08/06/26.
//

import SwiftUI

struct ImagemBoasVindas: View
{
    var body: some View
    {
        ZStack
        {

            Image("imagemBoasVindas")
                .resizable()
                .scaledToFit()
                .cornerRadius(24)
            
            VStack
            {
                Text("Bem-vindo(a)!")

                Text("Pronto para transformar o hoje?")
                    .font(.title2)
            }
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.ultraThinMaterial.opacity(0.9))
            .cornerRadius(24)
            .offset(y: 40)
        }
    }
}

#Preview {
    ImagemBoasVindas()
}
