//
//  DicasModel.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 17/07/26.
//

import SwiftUI

enum TipoDica: String
{
    case dica
    case voceSabia
    case mitoOuVerdade
    case impactoAmbiental
    case materialDaSemana

    var titulo: String
    {
        switch self
        {
        case .dica:
            return "Dica"

        case .voceSabia:
            return "Você sabia?"

        case .mitoOuVerdade:
            return "Mito ou Verdade"

        case .impactoAmbiental:
            return "Impacto Ambiental"

        case .materialDaSemana:
            return "Material da Semana"
        }
    }
    
    var icone: String
    {
        switch self
        {
        case .dica: return "lightbulb.fill"
        case .voceSabia: return "sparkles"
        case .mitoOuVerdade: return "questionmark.circle.fill"
        case .impactoAmbiental: return "leaf.fill"
        case .materialDaSemana: return "shippingbox.fill"
        }
    }
    
    var cor: Color
    {
        switch self
        {
        case .dica: return .orange
        case .voceSabia: return .blue
        case .mitoOuVerdade: return .purple
        case .impactoAmbiental: return .green
        case .materialDaSemana: return .brown
        }
    }
}

struct DicaHome: Identifiable
{
    let id: Int
    let tipo: TipoDica
    let titulo: String
    let descricao: String
}

enum DicasHome
{
    static let todas: [DicaHome] = [
        DicaHome(
            id: 1,
            tipo: .dica,
            titulo: "Separe os recicláveis",
            descricao: "Mantenha papel, plástico, vidro e metal separados do lixo orgânico. Isso facilita a reciclagem."
        ),

        DicaHome(
            id: 2,
            tipo: .dica,
            titulo: "Embalagens limpas",
            descricao: "Não é necessário lavar completamente as embalagens. Basta retirar o excesso de alimento."
        ),
        
        DicaHome(
            id: 3,
            tipo: .dica,
            titulo: "Amasse as latinhas",
            descricao: "Latas de alumínio amassadas ocupam menos espaço e tornam o transporte e o armazenamento mais eficientes."
        ),

        DicaHome(
            id: 4,
            tipo: .dica,
            titulo: "Desmonte o papelão",
            descricao: "Caixas de papelão desmontadas economizam espaço e facilitam a coleta seletiva."
        ),

        DicaHome(
            id: 5,
            tipo: .dica,
            titulo: "Descarte o óleo corretamente",
            descricao: "Guarde o óleo de cozinha usado em uma garrafa e leve até um ponto de coleta. Nunca o descarte na pia."
        ),

        DicaHome(
            id: 6,
            tipo: .dica,
            titulo: "Proteja o vidro quebrado",
            descricao: "Embale vidros quebrados em papelão ou jornal antes do descarte para evitar acidentes."
        ),

        DicaHome(
            id: 7,
            tipo: .dica,
            titulo: "Reutilize antes de reciclar",
            descricao: "Antes de descartar um objeto, veja se ele pode ganhar uma nova utilidade."
        ),

        DicaHome(
            id: 8,
            tipo: .dica,
            titulo: "Eletrônicos têm destino certo",
            descricao: "Celulares, computadores, carregadores e cabos devem ser levados a pontos específicos de coleta."
        ),

        DicaHome(
            id: 9,
            tipo: .dica,
            titulo: "Organize um espaço em casa",
            descricao: "Ter um local reservado para recicláveis torna a separação muito mais prática no dia a dia."
        ),

        DicaHome(
            id: 10,
            tipo: .dica,
            titulo: "Separe tampas e embalagens",
            descricao: "Sempre que possível, mantenha tampas junto das embalagens. Muitas cooperativas conseguem separar os materiais."
        ),

        DicaHome(
            id: 11,
            tipo: .voceSabia,
            titulo: "O ciclo da latinha",
            descricao: "Uma lata de alumínio pode voltar às prateleiras em cerca de 60 dias depois de ser reciclada."
        ),

        DicaHome(
            id: 12,
            tipo: .voceSabia,
            titulo: "Vidro sem fim",
            descricao: "O vidro pode ser reciclado diversas vezes sem perder suas propriedades."
        ),

        DicaHome(
            id: 13,
            tipo: .voceSabia,
            titulo: "Energia economizada",
            descricao: "Reciclar alumínio consome muito menos energia do que produzir alumínio novo a partir da matéria-prima."
        ),

        DicaHome(
            id: 14,
            tipo: .voceSabia,
            titulo: "Garrafa que vira roupa",
            descricao: "Garrafas PET recicladas podem ser transformadas em tecidos, mochilas, carpetes e roupas."
        ),

        DicaHome(
            id: 15,
            tipo: .voceSabia,
            titulo: "Menos árvores derrubadas",
            descricao: "Reciclar papel ajuda a reduzir a necessidade de utilizar novas matérias-primas e preserva recursos naturais."
        ),
        
        DicaHome(
            id: 16,
            tipo: .voceSabia,
            titulo: "O tempo do vidro",
            descricao: "Uma garrafa de vidro pode permanecer na natureza por milhares de anos se descartada incorretamente."
        ),

        DicaHome(
            id: 17,
            tipo: .voceSabia,
            titulo: "Pilhas merecem atenção",
            descricao: "Pilhas e baterias possuem materiais que podem contaminar o solo e a água quando descartadas no lixo comum."
        ),

        DicaHome(
            id: 18,
            tipo: .voceSabia,
            titulo: "Menos petróleo",
            descricao: "Reciclar plástico ajuda a reduzir o consumo de petróleo utilizado na fabricação de novos produtos."
        ),

        DicaHome(
            id: 19,
            tipo: .voceSabia,
            titulo: "Cada embalagem conta",
            descricao: "Uma única embalagem reciclada pode parecer pouco, mas milhões delas fazem uma enorme diferença para o planeta."
        ),

        DicaHome(
            id: 20,
            tipo: .voceSabia,
            titulo: "A coleta começa em casa",
            descricao: "A reciclagem só acontece quando cada pessoa faz sua parte separando corretamente os resíduos."
        ),

        DicaHome(
            id: 21,
            tipo: .mitoOuVerdade,
            titulo: "Preciso lavar tudo?",
            descricao: "Mito! Basta remover o excesso de sujeira. Não é necessário desperdiçar água deixando as embalagens completamente limpas."
        ),

        DicaHome(
            id: 22,
            tipo: .mitoOuVerdade,
            titulo: "Espelho é vidro reciclável?",
            descricao: "Mito! Espelhos possuem uma composição diferente do vidro utilizado em garrafas e potes."
        ),

        DicaHome(
            id: 23,
            tipo: .mitoOuVerdade,
            titulo: "Vidro quebrado pode reciclar?",
            descricao: "Verdade! Mas ele deve ser embalado corretamente para evitar acidentes durante a coleta."
        ),

        DicaHome(
            id: 24,
            tipo: .mitoOuVerdade,
            titulo: "Todo plástico é reciclável?",
            descricao: "Mito! Alguns tipos ainda possuem reciclagem limitada ou não são aceitos em todas as cidades."
        ),

        DicaHome(
            id: 25,
            tipo: .mitoOuVerdade,
            titulo: "Caixa de pizza sempre recicla?",
            descricao: "Mito! Se estiver muito engordurada, ela pode não ser aceita para reciclagem."
        ),

        DicaHome(
            id: 26,
            tipo: .mitoOuVerdade,
            titulo: "Tampinhas também reciclam?",
            descricao: "Verdade! Tampinhas plásticas podem ser recicladas e muitas campanhas ainda as utilizam para arrecadar recursos."
        ),

        DicaHome(
            id: 27,
            tipo: .mitoOuVerdade,
            titulo: "Papel molhado recicla?",
            descricao: "Verdade! O papel molhado perde qualidade e muitas vezes não pode ser reciclado."
        ),

        DicaHome(
            id: 28,
            tipo: .mitoOuVerdade,
            titulo: "Reciclar é o primeiro passo?",
            descricao: "Mito! Antes de reciclar, procure reduzir o consumo e reutilizar os materiais sempre que possível."
        ),

        DicaHome(
            id: 29,
            tipo: .mitoOuVerdade,
            titulo: "Latas enferrujadas podem reciclar?",
            descricao: "Verdade! Mesmo enferrujadas, elas ainda podem ser recicladas."
        ),

        DicaHome(
            id: 30,
            tipo: .mitoOuVerdade,
            titulo: "Guardanapo usado é reciclável?",
            descricao: "Mito! Guardanapos utilizados normalmente estão contaminados e devem ser descartados no lixo comum ou na compostagem, quando possível."
        ),

        DicaHome(
            id: 31,
            tipo: .impactoAmbiental,
            titulo: "Menos extração",
            descricao: "Reciclar reduz a necessidade de retirar novas matérias-primas da natureza."
        ),

        DicaHome(
            id: 32,
            tipo: .impactoAmbiental,
            titulo: "Menos emissões",
            descricao: "A reciclagem ajuda a reduzir a emissão de gases responsáveis pelo aquecimento global."
        ),

        DicaHome(
            id: 33,
            tipo: .impactoAmbiental,
            titulo: "Aterros mais duradouros",
            descricao: "Separar recicláveis diminui a quantidade de resíduos enviados aos aterros sanitários."
        ),

        DicaHome(
            id: 34,
            tipo: .impactoAmbiental,
            titulo: "Economia de recursos",
            descricao: "Reciclar contribui para economizar água, energia e matérias-primas."
        ),

        DicaHome(
            id: 35,
            tipo: .impactoAmbiental,
            titulo: "Mais segurança",
            descricao: "Separar corretamente os resíduos ajuda a proteger os profissionais que trabalham na coleta e na triagem."
        ),

        DicaHome(
            id: 36,
            tipo: .impactoAmbiental,
            titulo: "Menos lixo nas ruas",
            descricao: "Quando descartados corretamente, os recicláveis deixam de obstruir bueiros e reduzir impactos urbanos."
        ),

        DicaHome(
            id: 37,
            tipo: .impactoAmbiental,
            titulo: "Pequenas atitudes",
            descricao: "Grandes mudanças ambientais começam com hábitos simples praticados todos os dias."
        ),

        DicaHome(
            id: 38,
            tipo: .impactoAmbiental,
            titulo: "O efeito do hábito",
            descricao: "Separar recicláveis diariamente gera um impacto positivo muito maior do que parece."
        ),

        DicaHome(
            id: 39,
            tipo: .impactoAmbiental,
            titulo: "Não desperdice recicláveis",
            descricao: "Quando um material reciclável vai para o lixo comum, ele pode deixar de ser reaproveitado."
        ),

        DicaHome(
            id: 40,
            tipo: .impactoAmbiental,
            titulo: "Consumir com consciência",
            descricao: "Escolher produtos reutilizáveis reduz significativamente a quantidade de resíduos produzidos."
        ),

        DicaHome(
            id: 41,
            tipo: .materialDaSemana,
            titulo: "PET",
            descricao: "Garrafas PET podem ser transformadas em novas embalagens, tecidos, mochilas e diversos outros produtos."
        ),

        DicaHome(
            id: 42,
            tipo: .materialDaSemana,
            titulo: "Alumínio",
            descricao: "O alumínio está entre os materiais mais reciclados do mundo e pode ser reaproveitado diversas vezes."
        ),

        DicaHome(
            id: 43,
            tipo: .materialDaSemana,
            titulo: "Vidro",
            descricao: "Garrafas e potes de vidro podem ser reciclados repetidamente sem perder qualidade."
        ),

        DicaHome(
            id: 44,
            tipo: .materialDaSemana,
            titulo: "Papelão",
            descricao: "Sempre que possível, entregue o papelão limpo, seco e desmontado."
        ),

        DicaHome(
            id: 45,
            tipo: .materialDaSemana,
            titulo: "Aço",
            descricao: "Latas de alimentos feitas de aço também podem ser recicladas e voltar à cadeia produtiva."
        ),

        DicaHome(
            id: 46,
            tipo: .materialDaSemana,
            titulo: "Óleo de cozinha",
            descricao: "Armazene o óleo usado em uma garrafa e leve-o a um ponto de coleta para evitar a contaminação da água."
        ),

        DicaHome(
            id: 47,
            tipo: .materialDaSemana,
            titulo: "Pilhas e baterias",
            descricao: "Esses materiais exigem descarte em pontos específicos para evitar danos ao meio ambiente."
        ),

        DicaHome(
            id: 48,
            tipo: .materialDaSemana,
            titulo: "Eletrônicos",
            descricao: "Equipamentos eletrônicos possuem componentes valiosos que podem ser recuperados por meio da reciclagem."
        ),

        DicaHome(
            id: 49,
            tipo: .materialDaSemana,
            titulo: "Caixas longa vida",
            descricao: "Embalagens longa vida são recicláveis e podem ser transformadas em novos produtos quando encaminhadas corretamente."
        ),

        DicaHome(
            id: 50,
            tipo: .materialDaSemana,
            titulo: "Tampinhas plásticas",
            descricao: "Além da reciclagem, tampinhas também podem participar de campanhas solidárias promovidas por diversas instituições."
        )
    ]
}
