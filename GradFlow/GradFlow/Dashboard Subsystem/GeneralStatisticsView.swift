//
//  GeneralStatistics.swift
//  GradFlow
//
//  Created by Marcel Dietl on 14.10.24.
//

import SwiftUI

struct GeneralStatisticsView: View {
    @Binding var student: Student

    var body: some View {
        HStack(alignment: .bottom, spacing: 100) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(String(format: "%.2f", student.currentGPA))")
                    .font(.title)
                    .foregroundColor(.green)
                Text("GPA")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading, spacing: 24) {
                ProgressView(value: Double(student.currentCredits), total: 120)
                    .scaleEffect(y: 1.5)
                Text("\(student.currentCredits) / 120 ECTS")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    GeneralStatisticsView(student: .constant(MockModel().student))
}
