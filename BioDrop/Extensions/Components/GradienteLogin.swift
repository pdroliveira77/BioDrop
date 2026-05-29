//
//  GradienteLogin.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import SwiftUI

struct GradienteLogin: View
{
    var body: some View
    {
        LinearGradient(colors:
                        [Color.primariaEscura,
                         Color.primariaTransparente,
                         Color.secundaria,
                         Color.primariaTransparente],
                       startPoint: .topTrailing,
                       endPoint: .bottomLeading)
    }
}

#Preview
{
    GradienteLogin()
}
