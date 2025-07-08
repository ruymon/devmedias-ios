//
//  SummaryView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//


import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var gradeStorage: GradeStorageService

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("Olá! Boas-vindas ao novo")
                            .font(.callout)
                            .foregroundColor(.secondary)
                        
                        Text("Mauá Médias")
                            .font(.largeTitle.bold())
                    }.padding(.top)

                    
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeaderView(
                            title: "Visão geral",
                            subtitle: "Notas de todas as matérias",
                            showAction: true
                        )
                        
                        OverviewChartView(subjects: gradeStorage.subjects)
                        
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeaderView(
                            title: "Minhas matérias",
                            subtitle: "Você tem \(gradeStorage.subjects.count) cadeiras",
                            showAction: true
                        )
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(gradeStorage.subjects) { subject in
                                    SubjectCardView(subject: subject)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
    }
}
