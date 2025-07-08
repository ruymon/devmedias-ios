//
//  GradeStorageService.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import Foundation

class GradeStorageService: ObservableObject {
    @Published var subjects: [Subject] = []

    private let key = "storedSubjects"

    init() {
        load()
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Subject].self, from: data) {
            subjects = decoded
        } else {
            subjects = [
                Subject(code: "EFB105", name: "Cálculo Diferencial", provas: 3.0, trabalhos: 2.0),
                Subject(code: "EFB110", name: "Vetores", provas: 1.5, trabalhos: 1.0),
                Subject(code: "EFB207", name: "Física", provas: 4.0, trabalhos: 2.0),
                Subject(code: "EFB302", name: "Desenho", provas: 6.0, trabalhos: 2.5)
            ]
        }
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(subjects) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func update(subject: Subject, withProvas provas: Double, trabalhos: Double) {
        if let index = subjects.firstIndex(where: { $0.id == subject.id }) {
            subjects[index].provas = provas
            subjects[index].trabalhos = trabalhos
            save()
        }
    }
}
