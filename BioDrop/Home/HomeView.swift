//
//  HomeView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 05/06/26.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View
{
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            LinearGradient(colors: [.white, .terciariaTransparente, .secundariaTransparente],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: .bottom)
            
            VStack
            {
                ImagemBoasVindas()
                
                HStack
                {
                    BotaoImagemLegenda(titulo: "Solicitar \nretirada",
                                       icone: "arrow.3.trianglepath",
                                       acao: {})
                    
                    Spacer()
                    
                    BotaoImagemLegenda(titulo: "Ver pontos próximos",
                                       icone: "mappin.and.ellipse",
                                       acao: {})
                }
                .padding(.top, 24)
                
                Spacer()
                Button("Logout")
                {
                    do
                    {
                        try Auth.auth().signOut()
                        print("Logout realizado")
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            BottomNavigation()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeView()
}
