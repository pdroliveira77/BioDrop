//
//  PBHModel.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import Foundation
import CoreLocation

struct PBHResponse: Decodable
{
    let success: Bool
    let result: PBHResult
}

struct PBHResult: Decodable
{
    let records: [PBHPontoDTO]
    let total: Int
}

struct PBHPontoDTO: Decodable, Identifiable
{
    let identificadorInterno: Int
    let idLEV: String
    let nome: String
    let tipoMaterialColetado: String
    let horarioFuncionamento: String?
    let tipoLogradouro: String?
    let nomeLogradouro: String?
    let numeroImovel: String?
    let letraImovel: String?
    let bairro: String?
    let regional: String?
    let referenciaLocalizacao: String?
    let geometria: String

    var id: String
    {
        idLEV
    }

    enum CodingKeys: String, CodingKey
    {
        case identificadorInterno = "_id"
        case idLEV = "ID_LEV"
        case nome = "NOME_LEV"
        case tipoMaterialColetado = "TIPO_MATERIAL_COLETADO"
        case horarioFuncionamento = "HORARIO_FUNCIONAMENTO"
        case tipoLogradouro = "TIPO_LOGRADOURO"
        case nomeLogradouro = "NOME_LOGRADOURO"
        case numeroImovel = "NUMERO_IMOVEL"
        case letraImovel = "LETRA_IMOVEL"
        case bairro = "BAIRRO"
        case regional = "REGIONAL"
        case referenciaLocalizacao = "REF_LOCALIZACAO"
        case geometria = "GEOMETRIA"
    }
}

enum PBHServiceError: LocalizedError
{
    case urlInvalida
    case respostaInvalida
    case requisicaoNaoConcluida

    var errorDescription: String?
    {
        switch self
        {
        case .urlInvalida:
            return "Não foi possível montar a URL da PBH."

        case .respostaInvalida:
            return "A PBH retornou uma resposta inválida."

        case .requisicaoNaoConcluida:
            return "A PBH não conseguiu concluir a consulta."
        }
    }
}
