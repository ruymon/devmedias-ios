//
//  MainTabView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var gradeStorage = GradeStorageService()

    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Label("Resumo", systemImage: "house.fill")
                }

            GradesView()
                .tabItem {
                    Label("Notas e médias", systemImage: "doc.text.fill")
                }

            PrizesView()
                .tabItem {
                    Label("Premiações", systemImage: "rosette")
                }

            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
        .environmentObject(gradeStorage)
    }
}


#Preview {
    MainTabView()
}
