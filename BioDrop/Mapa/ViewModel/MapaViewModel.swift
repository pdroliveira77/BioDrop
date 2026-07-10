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

final class MapaViewModel: ObservableObject
{
    @Published var posicao: MapCameraPosition = .userLocation(followsHeading: false, fallback: .automatic)
    
    let locationManager = LocationManager()

    let pontos: [PontoColeta] =
    [
        PontoColeta(
            nome: "Coleta Centro",
            endereco: "Av. Afonso Pena",
            coordenada: CLLocationCoordinate2D(
                latitude: -19.9191,
                longitude: -43.9386
            )
        ),

        PontoColeta(
            nome: "Ecoponto Savassi",
            endereco: "Praça da Savassi",
            coordenada: CLLocationCoordinate2D(
                latitude: -19.9387,
                longitude: -43.9344
            )
        )
    ]
}
