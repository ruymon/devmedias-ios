//
//  OverviewChartView.swift
//  devmedias-ios
//
//  Created by Ruy Monteiro on 07/07/25.
//

import SwiftUI
import Charts

struct OverviewChartView: View {
    var subjects: [Subject]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("MÉDIAS")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Spacer()
                Label("~ 2,5 abaixo do ideal", systemImage: "arrow.down")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Chart {
                ForEach(subjects) { subject in
                    BarMark(
                        x: .value("Matéria", subject.code),
                        y: .value("Nota", subject.provas)
                    )
                    .foregroundStyle(.blue)
   
                    BarMark(
                        x: .value("Matéria", subject.code),
                        y: .value("Nota", subject.trabalhos),
                        stacking: .standard
                    )
                    .foregroundStyle(.orange)
                    
    
                    BarMark(
                        x: .value("Matéria", subject.code),
                        y: .value("Nota", subject.pendente),
                        stacking: .standard
                    )
                    .foregroundStyle(Color(.systemGray6))
                }

                RuleMark(y: .value("Meta", 6))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [4]))
                    .foregroundStyle(.green)
                    .annotation(position: .top, alignment: .trailing) {
                        Text("Média Ideal")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 200)

            HStack(spacing: 16) {
                LegendDot(color: .blue, label: "Provas")
                LegendDot(color: .orange, label: "Trabalho")
                LegendDot(color: .gray, label: "Pendente")
            }
            .font(.caption)
        }
    }
}

struct LegendDot: View {
    var color: Color
    var label: String

    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 10, height: 10)
            Text(label)
        }
    }
}
