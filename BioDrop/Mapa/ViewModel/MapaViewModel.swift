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
//    @Published var posicao: MapCameraPosition = .userLocation(followsHeading: false, fallback: .automatic)
    @Published var posicao: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -19.83159,
                longitude: -43.91689
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    @Published var pontosColeta: [PontoColeta] = []
    
    private let service = OverpassService()
    let locationManager = LocationManager()

    @MainActor
    func carregarPontosColeta() async
    {
        guard let localizacao = locationManager.location else
        {
            print("Localização ainda não disponível.")
            return
        }
        
        do
        {
            pontosColeta = try await service.buscarPontos(latitude: localizacao.coordinate.latitude,
                                                          longitude: localizacao.coordinate.longitude)
        }
        catch
        {
            print(error)
        }
    }
}
