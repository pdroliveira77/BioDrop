//
//  PBHService.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import Foundation

final class PBHService
{
    private let resourceID = "e2d67ad0-fb75-44d0-b3bb-e10396f79fb8"

    func buscarPontos() async throws -> [PBHPontoDTO]
    {
        var components = URLComponents(string: "https://dados.pbh.gov.br/pt_BR/api/3/action/datastore_search")

        components?.queryItems = [
            URLQueryItem(
                name: "resource_id",
                value: resourceID
            ),
            URLQueryItem(
                name: "limit",
                value: "100"
            )
        ]

        guard let url = components?.url else
        {
            throw PBHServiceError.urlInvalida
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else
        {
            throw PBHServiceError.respostaInvalida
        }

        let retorno = try JSONDecoder().decode(PBHResponse.self,from: data)

        guard retorno.success else
        {
            throw PBHServiceError.requisicaoNaoConcluida
        }

        return retorno.result.records
    }
}
