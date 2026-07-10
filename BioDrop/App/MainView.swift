//
//  MainView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct MainView: View
{
    @State private var abaSelecionada: AbaSelecionada = .home

    var body: some View
    {
        switch abaSelecionada
        {
        case .home:
            HomeView(abaSelecionada: $abaSelecionada)

        case .mapa:
            MapaView(abaSelecionada: $abaSelecionada)

        case .perfil:
            PerfilView(viewModel: PerfilViewModel(), abaSelecionada: $abaSelecionada)
        }
    }
}

#Preview {
    MainView()
}
