//
//  DetalhesPontoColetaView.swift
//  BioDrop
//
//  Created by pedro on 23/07/26.
//

import SwiftUI
import MapKit

struct DetalhesPontoColetaView: View
{
    let ponto: PontoColeta
    
    private var linkLocalizacao: URL
    {
        let latitude = ponto.coordenada.latitude
        let longitude = ponto.coordenada.longitude

        return URL(string: "https://maps.apple.com/?ll=\(latitude),\(longitude)")!
    }

    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading, spacing: 16)
            {
                HStack
                {
                    Text(ponto.nome)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.secundaria)
                    
                    Spacer()
                    
                    ShareLink(
                        item: linkLocalizacao,
                        subject: Text(ponto.nome),
                        message: Text(
                            """
                            Confira este ponto de coleta no BioDrop:
                            \(ponto.nome)
                            \(ponto.endereco)
                            """
                        )
                    )
                    {
                        Label("",
                              systemImage: "square.and.arrow.up")
                        .padding()
                        .foregroundStyle(Color.secundaria)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                Divider()

                if !ponto.endereco.isEmpty
                {
                    Text("Endereço:")
                        .font(.headline)
                    Label(
                        ponto.endereco,
                        systemImage: "mappin.and.ellipse"
                    )
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    Divider()
                }

                if let horarioFuncionamento = ponto.horarioFuncionamento, !horarioFuncionamento.isEmpty
                {
                    Text("Horário de funcionamento:")
                        .font(.headline)
                    
                    Label(
                        horarioFuncionamento,
                        systemImage: "clock"
                    )
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    Divider()
                }

                if !ponto.materiais.isEmpty
                {
                    VStack(alignment: .leading, spacing: 8)
                    {
                        Text("Materiais aceitos:")
                            .font(.headline)

                        ForEach(ponto.materiais, id: \.self)
                        {
                            material in

                            Label(
                                material,
                                systemImage: "checkmark.circle.fill"
                            )
                            .foregroundStyle(Color.primariaEscura)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 16)
        }
    }
}

#Preview {
    DetalhesPontoColetaView(ponto: PontoColeta(id: "1",
                                               nome: "Ponto Verde",
                                               endereco: "Rua da coleta, 123",
                                               coordenada: CLLocationCoordinate2D(
                                                latitude: -19.9191,
                                                longitude: -43.9386),
                                               materiais: ["Plasticos", "Vidros"],
                                               horarioFuncionamento: "08h às 18h",
                                               origem: OrigemPontoColeta.pbh))
}
