//
//  CarregamentoView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import SwiftUI

struct CarregamentoView: View
{
    @State private var progress: CGFloat = 0
    private let alturaLogo: CGFloat = 140
    var texto = ""
    
    var body: some View
    {
        ZStack
        {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            VStack
            {
                ZStack
                {
                    Image("logoCinza")
                        .resizable()
                        .scaledToFit()

                    Image("logoApp")
                        .resizable()
                        .scaledToFit()
                        .mask(alignment: .bottom)
                        {
                            Rectangle()
                                .frame(height: progress)
                        }
                }
                .frame(width: alturaLogo, height: alturaLogo)
                
                Text(texto)
                    .font(.headline)
                    .foregroundStyle(Color.primariaEscura)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 220, height: 220)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .onAppear
        {
            progress = 0
            withAnimation(.easeInOut(duration: 2)
                .repeatForever(autoreverses: true))
            {
                progress = alturaLogo
            }
        }
    }
}

#Preview {
    CarregamentoView(texto: "Carregando")
}
