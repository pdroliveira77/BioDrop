//
//  HomeView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 05/06/26.
//

import SwiftUI

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
                Spacer()
            }
            
            BottomNavigation()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeView()
}
