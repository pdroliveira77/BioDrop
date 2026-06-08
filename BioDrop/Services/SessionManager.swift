//
//  SessionManager.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 08/06/26.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Combine

final class SessionManager: ObservableObject
{
    @Published var usuarioLogado = false

    private var handle: AuthStateDidChangeListenerHandle?

    init()
    {
        handle = Auth.auth().addStateDidChangeListener
        {
            _, usuario in

            DispatchQueue.main.async
            {
                self.usuarioLogado = usuario != nil
            }
        }
    }
}
