//
//  SpecificStatisticsView.swift
//  GradFlow
//
//  Created by Marcel Dietl on 14.10.24.
//

import SwiftUI

struct DetailedStatisticsView: View {
    @Binding var student: Student

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible(), alignment: .top)], spacing: 30) {
                ForEach(StudyCategory.allCategories, id: \.self) { category in
                    let totalCredits = category.minCreditsRequired
                    let completedCredits = student.creditsPerCategory[category] ?? 0
                    let gpa = student.gpaPerCategory[category] ?? 0.0
                    
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 10)
                                .opacity(0.3)
                                .foregroundColor(.blue)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Double(completedCredits) / Double(totalCredits)))
                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .foregroundColor(.blue)
                                .rotationEffect(Angle(degrees: -90))
                                .animation(.linear, value: completedCredits)
                            VStack {
                                Text("\(completedCredits)/\(totalCredits) ECTS")
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom, 1)
                                Text(completedCredits == 0 ? "None" : "\(String(format: "%.2f", gpa)) GPA")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(completedCredits == 0 ? .gray : .green)
                            }
                        }.frame(width: 80, height: 80)
                        
                        Text(category.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 80)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    DetailedStatisticsView(student: .constant(MockModel().student))
}
