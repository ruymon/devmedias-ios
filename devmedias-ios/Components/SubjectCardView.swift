//
//  SubjectCardView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI

struct SubjectCardView: View {
    var subject: Subject

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                ZStack {
                    Circle()
                        .fill(.background)
                        .frame(width: 40, height: 40)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    
                    Image(systemName: iconForSubject(subject.code))
                        .font(.system(size: 20))
                        .foregroundColor(iconColor(for: subject.code))
                }
                
                Spacer()
            }
            
            Spacer()
            
            // Subject info
            VStack(alignment: .leading, spacing: 4) {
                Text(subject.code)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(subject.name)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(width: 160, height: 112)
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
    
    private func iconForSubject(_ code: String) -> String {
        switch code {
        case "EFB105":
            return "function" // Calculus
        case "EFB110":
            return "arrow.right" // Vectors
        case "EFB207":
            return "atom" // Physics
        case "EFB302":
            return "pencil.and.outline" // Drawing
        case "EFB403":
            return "curlybraces" // Programming
        case "EFB502":
            return "testtube.2" // Chemistry
        case "EFB501":
            return "waveform.path.ecg" // General
        default:
            return "book.fill"
        }
    }
    
    // Helper function to determine icon color
    private func iconColor(for code: String) -> Color {
        switch code {
        case "EFB105":
            return .blue
        case "EFB110":
            return .green
        case "EFB207":
            return .orange
        case "EFB302":
            return .purple
        case "EFB403":
            return .red
        case "EFB502":
            return .cyan
        case "EFB501":
            return .mint
        default:
            return .gray
        }
    }
}

