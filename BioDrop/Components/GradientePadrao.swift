//
//  GradientePadrao.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 20/06/26.
//

import SwiftUI

struct GradientePadrao: View
{
    var body: some View
    {
        LinearGradient(colors:
                        [Color.white,
                         Color.white,
                         Color.white,
                         Color.primariaTransparente],
                       startPoint: .top,
                       endPoint: .bottom)
    }
}

#Preview {
    GradientePadrao()
}
