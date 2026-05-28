//
//  ContentView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/05/26.
//

import SwiftUI

struct LoginView: View
{
    @State private var posicaoY: CGFloat = -30
    @State private var esconderSenha = true
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                LinearGradient(colors:
                                [Color.primariaEscura,
                                 Color.primariaTransparente,
                                 Color.secundaria,
                                 Color.primariaTransparente],
                               startPoint: .topTrailing,
                               endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack(spacing: 24)
                {
                    Spacer()
                    VStack(spacing: 12)
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

                        Text("Por um futuro mais limpo e sustentável.")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(spacing: 20)
                    {
                        VStack(alignment: .leading, spacing: 8)
                        {
                            Text("E-MAIL")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)

                            HStack
                            {
                                Image(systemName: "envelope")
                                    .foregroundStyle(.secondary)

                                TextField(
                                    "nome@exemplo.com",
                                    text: .constant("")
                                )
                            }
                            .padding()
                            .frame(height: 56)
                            .background(Color.white.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        
                        VStack(alignment: .leading, spacing: 8)
                        {
                            HStack
                            {
                                Text("SENHA")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)

                                Spacer()

                                Button("Esqueci minha senha")
                                {

                                }
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primariaEscura)
                            }

                            HStack
                            {
                                Image(systemName: "lock")
                                    .foregroundStyle(.secondary)

                                Group
                                {
                                    if esconderSenha
                                    {
                                        SecureField(
                                            "••••••••",
                                            text: .constant("")
                                        )
                                    }
                                    else
                                    {
                                        TextField(
                                            "••••••••",
                                            text: .constant("")
                                        )
                                    }
                                }
                                .foregroundStyle(.black)

                                Button
                                {
                                    esconderSenha.toggle()
                                }
                                label:
                                {
                                    Image(systemName: esconderSenha ? "eye" : "eye.slash")
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding()
                            .frame(height: 56)
                            .background(Color.white.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        
                        Button
                        {

                        }
                        label:
                        {
                            Text("Entrar")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(
                                    LinearGradient(
                                        colors:
                                        [
                                            Color.green.opacity(0.6),
                                            Color.primariaEscura,
                                            Color.primariaEscura
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .shadow(
                            color: Color.primariaEscura.opacity(0.2),
                            radius: 10,
                            y: 6
                        )
                    }
                    .padding(24)
                    .background(
                        .white.opacity(0.55)
                    )
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .overlay
                    {
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(.white.opacity(0.3), lineWidth: 1)
                    }
                    
                    HStack(spacing: 4)
                    {
                        Text("Não tem uma conta?")
                            .foregroundStyle(.secondary)

                        Button("Criar conta agora")
                        {

                        }
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primariaEscura)
                    }
                    .font(.subheadline)

                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
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

#Preview {
    LoginView()
        
}
