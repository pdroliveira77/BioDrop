//
//  Logo.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import SwiftUI

struct Logo: View
{
    @State private var posicaoY: CGFloat = -30
    
    var body: some View
    {
        Image("logoApp")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .offset(y: posicaoY)
            .onAppear
            {
                animarQueda()
            }
            
        Text("BioDrop")
            .font(.system(size: 42, weight: .bold))
            .foregroundStyle(Color.primariaEscura)
    }
    
    func animarQueda()
    {
        withAnimation(.easeIn(duration: 0.6))
        {
            posicaoY = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6)
        {
            withAnimation(.easeOut(duration: 0.8))
            {
                posicaoY = -30
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8)
            {
                animarQueda()
            }
        }
    }
}

#Preview
{
    Logo()
}
