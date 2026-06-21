//
//  AppView.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 08/06/26.
//

import SwiftUI

struct AppView: View
{
    @StateObject private var sessionManager = SessionManager()

    var body: some View
    {
        if sessionManager.usuarioLogado
        {
            MainView()
        }
        else
        {
            LoginView()
        }
    }
}
