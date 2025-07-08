//
//  Subject.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//


import Foundation

struct Subject: Identifiable, Codable {
    let id: UUID
    let code: String
    let name: String
    var provas: Double
    var trabalhos: Double

    var total: Double {
        min(provas + trabalhos, 10)
    }

    var pendente: Double {
        max(10 - total, 0)
    }

    init(code: String, name: String, provas: Double, trabalhos: Double) {
        self.id = UUID()
        self.code = code
        self.name = name
        self.provas = provas
        self.trabalhos = trabalhos
    }
}
