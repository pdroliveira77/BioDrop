//
//  LocationManager.swift
//  BioDrop
//
//  Created by pedro on 09/07/26.
//

import CoreLocation
import Combine

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate
{
    private let manager = CLLocationManager()

    @Published var location: CLLocation?

    override init()
    {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func solicitarPermissao()
    {
        switch manager.authorizationStatus
        {

        case .authorizedAlways,
             .authorizedWhenInUse:

            manager.startUpdatingLocation()

        case .notDetermined:

            manager.requestWhenInUseAuthorization()

        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
    {
        switch manager.authorizationStatus
        {
        case .notDetermined:
            print("NOT DETERMINED")
            
        case .authorizedWhenInUse:
            print("AUTHORIZED WHEN IN USE")
            
        case .authorizedAlways:
            print("AUTHORIZED ALWAYS")
            
        case .denied:
            print("DENIED")
            
        case .restricted:
            print("RESTRICTED")
            
        @unknown default:
            print("UNKNOWN")
        }
        
        switch manager.authorizationStatus
        {
        case .authorizedWhenInUse,
                .authorizedAlways:
            
            print("Permissão concedida")
            manager.startUpdatingLocation()
            
        case .denied:
            print("Permissão negada")
            
        case .restricted:
            print("Permissão restrita")
            
        case .notDetermined:
            print("Ainda não determinada")
            
        @unknown default:
            break
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.last
        manager.stopUpdatingLocation()
    }    
}
