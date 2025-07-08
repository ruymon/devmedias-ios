//
//  GradeRowView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI

struct GradeRowView: View {
    var subject: Subject

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subject.code).font(.caption).foregroundColor(.secondary)
                Text(subject.name).font(.body)
            }
            Spacer()
            GradeBadgeView(grade: subject.total)
        }
        .padding(.vertical, 8)
    }
}
