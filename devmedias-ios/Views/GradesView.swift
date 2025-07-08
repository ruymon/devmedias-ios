//
//  GradesView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//


import SwiftUI

struct GradesView: View {
    @EnvironmentObject var gradeStorage: GradeStorageService
    @State private var searchText = ""

    var filteredSubjects: [Subject] {
        if searchText.isEmpty {
            return gradeStorage.subjects
        } else {
            return gradeStorage.subjects.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.code.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
           VStack(spacing: 0) {
               
               
               HStack {
                   Image(systemName: "magnifyingglass")
                       .foregroundColor(.secondary)
                   
                   TextField("Buscar", text: $searchText)
                       .textFieldStyle(PlainTextFieldStyle())
                   
                   if !searchText.isEmpty {
                       Button(action: {
                           searchText = ""
                       }) {
                           Image(systemName: "xmark.circle.fill")
                               .foregroundColor(.secondary)
                       }
                   }
                   
                   Button(action: {
                       // Voice search action
                   }) {
                       Image(systemName: "mic")
                           .foregroundColor(.secondary)
                   }
               }
               .padding(.horizontal, 12)
               .padding(.vertical, 8)
               .background(Color(.systemGray6))
               .cornerRadius(10)
               .padding(.horizontal)
               .padding(.top, 16)
               
               // Sort button
               HStack {
                   Button(action: {
                       // Sort action
                   }) {
                       HStack {
                           Text("Ordenar por")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                           
                           Image(systemName: "arrow.up.arrow.down")
                               .font(.caption)
                               .foregroundColor(.blue)
                       }
                   }
                   
                   Spacer()
               }
               .padding(.horizontal)
               .padding(.top, 16)
               
               // List
               List {
                   ForEach(filteredSubjects) { subject in
                       GradeRowView(subject: subject)
                   }
               }
               .listStyle(PlainListStyle())
           }
           .navigationTitle("Notas")
           .navigationBarTitleDisplayMode(.large)
       }
   }
}
