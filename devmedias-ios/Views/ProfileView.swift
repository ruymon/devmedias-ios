//
//  ProfileView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    @State private var showingSignOutAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Header
                    VStack(spacing: 16) {
                        // Profile Picture
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.gray)
                        
                        VStack(spacing: 4) {
                            Text("Ruy Monteiro")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("24.00846-0")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                       
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Settings Sections
                    VStack(spacing: 16) {
                        // Appearance Section
                        SettingsSection(title: "Aparência") {
                            VStack(spacing: 0) {
                                SettingsRow(
                                    icon: "sun.max.fill",
                                    iconColor: .orange,
                                    title: "Tema"
                                ) {
                                    Picker("Tema", selection: $isDarkMode) {
                                        Text("Claro").tag(false)
                                        Text("Escuro").tag(true)
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 120)
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                SettingsRow(
                                    icon: "bell.fill",
                                    iconColor: .red,
                                    title: "Notificações"
                                ) {
                                    Toggle("", isOn: $notificationsEnabled)
                                        .labelsHidden()
                                }
                            }
                        }
                        
                        // Academic Section
                        SettingsSection(title: "Acadêmico") {
                            VStack(spacing: 0) {
                                SettingsRow(
                                    icon: "calendar",
                                    iconColor: .blue,
                                    title: "Semestre Atual"
                                ) {
                                    Text("2025.1")
                                        .foregroundColor(.secondary)
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                SettingsRow(
                                    icon: "graduationcap.fill",
                                    iconColor: .green,
                                    title: "Curso"
                                ) {
                                    Text("Engenharia - Tronco Elétrica")
                                        .foregroundColor(.secondary)
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                SettingsRow(
                                    icon: "chart.bar.fill",
                                    iconColor: .purple,
                                    title: "Estatísticas"
                                ) {
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        // Account Section
                        SettingsSection(title: "Conta") {
                            VStack(spacing: 0) {
                                SettingsRow(
                                    icon: "person.crop.circle",
                                    iconColor: .blue,
                                    title: "Informações da Conta"
                                ) {
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                SettingsRow(
                                    icon: "lock.fill",
                                    iconColor: .gray,
                                    title: "Privacidade"
                                ) {
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        // Support Section
                        SettingsSection(title: "Suporte") {
                            VStack(spacing: 0) {
                                SettingsRow(
                                    icon: "questionmark.circle.fill",
                                    iconColor: .orange,
                                    title: "Ajuda"
                                ) {
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                SettingsRow(
                                    icon: "envelope.fill",
                                    iconColor: .blue,
                                    title: "Contato"
                                ) {
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        // Sign Out Button
                        Button(action: {
                            showingSignOutAlert = true
                        }) {
                            Text("Sair")
                                .font(.headline)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.red.opacity(0.2), lineWidth: 1)
                                )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.large)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .alert("Sair", isPresented: $showingSignOutAlert) {
                Button("Cancelar", role: .cancel) { }
                Button("Sair", role: .destructive) {
                    // Sign out action
                }
            } message: {
                Text("Tem certeza que deseja sair da sua conta?")
            }
        }
    }
}

struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            content
                .background(Color(UIColor.systemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
        }
    }
}

struct SettingsRow<Content: View>: View {
    let icon: String
    let iconColor: Color
    let title: String
    let content: Content
    
    init(icon: String, iconColor: Color, title: String, @ViewBuilder content: () -> Content) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(iconColor)
                .cornerRadius(6)
            
            Text(title)
                .font(.body)
            
            Spacer()
            
            content
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}
