//
//  MapaViewModel.swift
//  BioDrop
//
//  Created by pedro on 09/07/26.
//

import Foundation
import SwiftUI
import MapKit
import Combine

@MainActor
final class MapaViewModel: ObservableObject
{
    @Published var posicao: MapCameraPosition = .userLocation(followsHeading: false, fallback: .automatic)
    @Published var pontosColeta: [PontoColeta] = []
    
    private let service = OverpassService()
    let locationManager = LocationManager()

    func carregarPontosColeta(latitude: Double, longitude: Double) async
    {
        do
        {
            pontosColeta = try await service.buscarPontos(latitude: latitude,
                                                          longitude: longitude)
        }
        catch
        {
            print(error)
        }
    }
}
