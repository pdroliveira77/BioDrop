//
//  PontosColetaRepository.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import CoreLocation

final class PontosColetaRepository
{
    private let pbhService: PBHService
    private let overpassService: OverpassService

    private let distanciaMaximaDuplicidade: CLLocationDistance = 50

    init(pbhService: PBHService = PBHService(), overpassService: OverpassService = OverpassService())
    {
        self.pbhService = pbhService
        self.overpassService = overpassService
    }

    func buscarPontos(latitude: Double, longitude: Double) async throws -> [PontoColeta]
    {
        async let consultaPBH = pbhService.buscarPontos()
        async let consultaOSM = overpassService.buscarPontos(latitude: latitude, longitude: longitude)

        let (retornoPBH, retornoOSM) = try await (consultaPBH, consultaOSM)

        let pontosPBH = retornoPBH.compactMap
        {
            $0.converterParaPontoColeta()
        }

        let pontosOSM = retornoOSM

        return mesclar(pontosPBH: pontosPBH, pontosOSM: pontosOSM)
    }

    private func mesclar(pontosPBH: [PontoColeta], pontosOSM: [PontoColeta]) -> [PontoColeta]
    {
        var resultado = pontosPBH

        for pontoOSM in pontosOSM
        {
            let possuiCorrespondenteNaPBH = pontosPBH.contains
            {
                pontoPBH in

                distancia(entre: pontoPBH, e: pontoOSM) <= distanciaMaximaDuplicidade
            }

            if !possuiCorrespondenteNaPBH
            {
                resultado.append(pontoOSM)
            }
        }

        return resultado
    }

    private func distancia(entre primeiroPonto: PontoColeta,e segundoPonto: PontoColeta) -> CLLocationDistance
    {
        let primeiraLocalizacao = CLLocation(
            latitude: primeiroPonto.coordenada.latitude,
            longitude: primeiroPonto.coordenada.longitude
        )

        let segundaLocalizacao = CLLocation(
            latitude: segundoPonto.coordenada.latitude,
            longitude: segundoPonto.coordenada.longitude
        )

        return primeiraLocalizacao.distance(
            from: segundaLocalizacao
        )
    }
}
