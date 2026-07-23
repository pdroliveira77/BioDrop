//
//  DiasSeguidosView.swift
//  BioDrop
//
//  Created by pedro on 23/07/26.
//

import SwiftUI

struct DiasSeguidosView: View
{
    var diasSeguidos = 0
    
    private var corDestaque: Color
    {
        diasSeguidos < 4 ? .orange.opacity(0.9) : Color.vermelhoEscuro
    }
    
    var body: some View
    {
        VStack(spacing: 5)
        {
            Image(systemName: diasSeguidos < 4 ? "timer" : "flame")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(corDestaque)
            
            Text("\(diasSeguidos)")
                .font(.largeTitle)
                .foregroundStyle(corDestaque)
            
            Text("Dias seguidos").textCase(.uppercase)
                .font(.caption)
                .foregroundStyle(corDestaque)
        }
        .padding()
        .frame(width: 165)
        .background(diasSeguidos < 4 ? Color.yellow.opacity(0.2) : Color.vermelhoClaro)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay
        {
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    corDestaque,
                    lineWidth: 1
                )
        }
    }
}

#Preview {
    DiasSeguidosView()
}
