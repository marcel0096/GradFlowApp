//
//  CourseCellView.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import Foundation
import SwiftUI

struct CourseCellView: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(course.name)
                        .font(.headline)
                    Text("\(course.category.name)")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(course.semester)")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.light)
                    Text("\(course.credits) ETCS")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.light)
                    if course.isCompleted, let grade = course.grade {
                        Text("\(grade, specifier: "%.1f")")
                            .foregroundColor(.green)
                            .fontWeight(.light)
                    }
                }
                .padding(.leading, 20)
            }
        }
    }
}

#Preview {
    CourseCellView(course: Course(name: "Sample Course",
                                  credits: 5,
                                  category: StudyCategory.mandatoryInformatics,
                                  isCompleted: true,
                                  semester: "WS23",
                                  grade: 1.3))
}
