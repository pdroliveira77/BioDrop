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
                latitude: -19.921356,
                longitude: -43.93414
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    @Published var pontosColeta: [PontoColeta] = []
    @Published var isLoading = false
    
    private let repository: PontosColetaRepository
    private var cancellables = Set<AnyCancellable>()
    let locationManager = LocationManager()
    
    init(repository: PontosColetaRepository)
    {
        self.repository = repository
        self.observarLocalizacao()
    }
    
    convenience init()
    {
        self.init(repository: PontosColetaRepository())
    }
    
    private func observarLocalizacao()
    {
        locationManager.$location
            .compactMap { $0 }
            .first()
            .sink
            {
                [weak self] location in

                Task
                {
                    await self?.carregarPontosColeta(
                        latitude: location.coordinate.latitude,
                        longitude: location.coordinate.longitude
                    )
                }
            }
            .store(in: &cancellables)
    }

    func carregarPontosColeta(latitude: Double, longitude: Double) async
    {
        isLoading = true
        defer { isLoading = false }
        
        do
        {
            let pontos = try await repository.buscarPontos(latitude: latitude, longitude: longitude)
            pontosColeta = pontos
            
            print("Total de pontos no mapa: \(pontosColeta.count)")
        }
        catch
        {
            print(error)
        }
    }
}
