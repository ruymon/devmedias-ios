//
//  SectionHeaderView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI

struct SectionHeaderView: View {
    var title: String
    var subtitle: String? = nil
    var showAction: Bool = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.title3.bold())
                if let subtitle = subtitle {
                    Text(subtitle).font(.subheadline).foregroundColor(.secondary)
                }
            }
            Spacer()
            if showAction {
                Text("Mais detalhes")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
    }
}
