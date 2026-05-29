//
//  BioDropApp.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/05/26.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseAuth

@main
struct BioDropApp: App
{
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene
    {
        WindowGroup
        {
            LoginView()
        }
    }
}
