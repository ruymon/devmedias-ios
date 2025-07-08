//
//  GradeBadgeView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI

struct GradeBadgeView: View {
    var grade: Double

    var color: Color {
        switch grade {
        case 6...: return .green
        case 4..<6: return .orange
        case ..<4: return .red
        default: return .gray
        }
    }

    var body: some View {
        Text(String(format: "%.1f", grade))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(color)
                        .cornerRadius(8)
    }
}
