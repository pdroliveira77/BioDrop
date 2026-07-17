//
//  ConversorUTM.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import Foundation
import CoreLocation

enum ConversorUTM
{
    static func converter(easting: Double,
                          northing: Double,
                          zona: Int,
                          hemisferioNorte: Bool) -> CLLocationCoordinate2D
    {
        // Elipsoide GRS 80, utilizado pelo SIRGAS 2000.
        let semiEixoMaior = 6_378_137.0
        let achatamento = 1.0 / 298.257222101
        let fatorEscala = 0.9996

        let excentricidadeQuadrada =
            achatamento * (2.0 - achatamento)

        let segundaExcentricidadeQuadrada =
            excentricidadeQuadrada /
            (1.0 - excentricidadeQuadrada)

        let x = easting - 500_000.0

        var y = northing

        if !hemisferioNorte
        {
            y -= 10_000_000.0
        }

        let meridianoCentralGraus =
            Double(zona - 1) * 6.0 - 180.0 + 3.0

        let arcoMeridional = y / fatorEscala

        let mu =
            arcoMeridional /
            (
                semiEixoMaior *
                (
                    1.0
                    - excentricidadeQuadrada / 4.0
                    - 3.0 * pow(excentricidadeQuadrada, 2.0) / 64.0
                    - 5.0 * pow(excentricidadeQuadrada, 3.0) / 256.0
                )
            )

        let e1 =
            (1.0 - sqrt(1.0 - excentricidadeQuadrada)) /
            (1.0 + sqrt(1.0 - excentricidadeQuadrada))

        let latitudeInicial =
            mu
            + (
                3.0 * e1 / 2.0
                - 27.0 * pow(e1, 3.0) / 32.0
            ) * sin(2.0 * mu)
            + (
                21.0 * pow(e1, 2.0) / 16.0
                - 55.0 * pow(e1, 4.0) / 32.0
            ) * sin(4.0 * mu)
            + (
                151.0 * pow(e1, 3.0) / 96.0
            ) * sin(6.0 * mu)
            + (
                1097.0 * pow(e1, 4.0) / 512.0
            ) * sin(8.0 * mu)

        let senoLatitudeInicial = sin(latitudeInicial)
        let cossenoLatitudeInicial = cos(latitudeInicial)
        let tangenteLatitudeInicial = tan(latitudeInicial)

        let n1 =
            semiEixoMaior /
            sqrt(
                1.0
                - excentricidadeQuadrada
                * pow(senoLatitudeInicial, 2.0)
            )

        let t1 = pow(tangenteLatitudeInicial, 2.0)

        let c1 =
            segundaExcentricidadeQuadrada
            * pow(cossenoLatitudeInicial, 2.0)

        let r1 =
            semiEixoMaior
            * (1.0 - excentricidadeQuadrada)
            / pow(
                1.0
                - excentricidadeQuadrada
                * pow(senoLatitudeInicial, 2.0),
                1.5
            )

        let d =
            x /
            (n1 * fatorEscala)

        let latitude =
            latitudeInicial
            - (
                n1
                * tangenteLatitudeInicial
                / r1
            )
            * (
                pow(d, 2.0) / 2.0
                - (
                    5.0
                    + 3.0 * t1
                    + 10.0 * c1
                    - 4.0 * pow(c1, 2.0)
                    - 9.0 * segundaExcentricidadeQuadrada
                )
                * pow(d, 4.0) / 24.0
                + (
                    61.0
                    + 90.0 * t1
                    + 298.0 * c1
                    + 45.0 * pow(t1, 2.0)
                    - 252.0 * segundaExcentricidadeQuadrada
                    - 3.0 * pow(c1, 2.0)
                )
                * pow(d, 6.0) / 720.0
            )

        let longitude =
            (
                d
                - (
                    1.0
                    + 2.0 * t1
                    + c1
                )
                * pow(d, 3.0) / 6.0
                + (
                    5.0
                    - 2.0 * c1
                    + 28.0 * t1
                    - 3.0 * pow(c1, 2.0)
                    + 8.0 * segundaExcentricidadeQuadrada
                    + 24.0 * pow(t1, 2.0)
                )
                * pow(d, 5.0) / 120.0
            )
            / cossenoLatitudeInicial

        let latitudeGraus =
            latitude * 180.0 / .pi

        let longitudeGraus =
            meridianoCentralGraus
            + longitude * 180.0 / .pi

        return CLLocationCoordinate2D(
            latitude: latitudeGraus,
            longitude: longitudeGraus
        )
    }
}
