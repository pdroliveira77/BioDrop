//
//  ContentView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/05/26.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
        {
            NavigationStack
            {
                ZStack
                {
                    LinearGradient(colors:
                                    [Color.primariaTransparente,
                                     .white],
                                   startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20)
                    {
                        Image("logoApp")
                        Text("BioDrop")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.primariaEscura)

                        Text("Por um futuro mais limpo e sustentável.")
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                        
                        ZStack
                        {
                            VStack
                            {
                                Label("Email", systemImage: "envelope")
                                    .foregroundColor(.secondary)
                                TextField("Email", text: .constant(""))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                
                                Label("Senha", systemImage: "lock")
                                    .foregroundColor(.secondary)
                                Button("Entrar")
                                {

                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.primariaEscura)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .padding(24)
                        }
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(RoundedRectangle(cornerRadius: 24)
                            .stroke(.white.opacity(0.2), lineWidth: 1))
                    }
                    .padding()
                }
            }
        }
}

#Preview {
    ContentView()
        
}
