//
//  HomeViewModel.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import Foundation
import Combine
import SwiftUI

final class HomeViewModel: ObservableObject
{
    @Published var dicaDoDia: DicaHome

    init()
    {
        let dia = Calendar.current.ordinality(
            of: .day,
            in: .year,
            for: Date()
        ) ?? 1

        dicaDoDia = DicasHome.todas[dia % DicasHome.todas.count]
    }
    
    func contarDiasSeguidos()
    {
        
    }
}
