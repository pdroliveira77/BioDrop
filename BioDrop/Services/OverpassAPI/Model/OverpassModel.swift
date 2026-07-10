//
//  OverpassModel.swift
//  BioDrop
//
//  Created by pedro on 10/07/26.
//

struct RespostaOverpass: Codable
{
    let versao: Double
    let gerador: String
    let informacoes: InformacoesOverpass
    let elementos: [ElementoOverpass]

    enum CodingKeys: String, CodingKey
    {
        case versao = "version"
        case gerador = "generator"
        case informacoes = "osm3s"
        case elementos = "elements"
    }
}

struct InformacoesOverpass: Codable
{
    let dataBase: String
    let copyright: String

    enum CodingKeys: String, CodingKey
    {
        case dataBase = "timestamp_osm_base"
        case copyright
    }
}

struct ElementoOverpass: Codable
{
    let tipo: String
    let id: Int

    let latitude: Double?
    let longitude: Double?

    let centro: CentroOverpass?

    let tags: TagsOverpass?

    enum CodingKeys: String, CodingKey
    {
        case tipo = "type"
        case id

        case latitude = "lat"
        case longitude = "lon"

        case centro = "center"

        case tags
    }
}

struct CentroOverpass: Codable
{
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey
    {
        case latitude = "lat"
        case longitude = "lon"
    }
}

struct TagsOverpass: Codable
{
    let nome: String?

    let cidade: String?
    let rua: String?
    let numero: String?
    let bairro: String?

    let operador: String?
    let descricao: String?

    let tipoReciclagem: String?

    let horarioFuncionamento: String?

    let website: String?

    enum CodingKeys: String, CodingKey
    {
        case nome = "name"

        case cidade = "addr:city"
        case rua = "addr:street"
        case numero = "addr:housenumber"
        case bairro = "addr:suburb"

        case operador = "operator"
        case descricao = "description"

        case tipoReciclagem = "recycling_type"

        case horarioFuncionamento = "opening_hours"

        case website
    }
}
