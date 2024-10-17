//
//  CourseAddViewModel.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import Foundation
import SwiftUI

@Observable class CourseAddViewModel {
    var courseName = ""
    var courseCredits = ""
    var courseCategory = ""
    var courseSemester = ""
    var courseGrade = ""
    var isCompleted = false
    var errorMessage: String?
    var showingAddCourse = false

    func buildCourse(with selectedCategory: StudyCategory) -> Course? {
        if courseName.isEmpty {
            errorMessage = "Course name is required."
            return nil
        }

        guard let credits = Int(courseCredits), credits > 0 else {
            errorMessage = "Credits must be a positive integer."
            return nil
        }

        if isCompleted {
            guard let gradeValue = Double(courseGrade), gradeValue >= 1.0 && gradeValue <= 5.0 else {
                errorMessage = "Grade must be between 1.0 and 5.0."
                return nil
            }
        }

        errorMessage = nil

        return Course(
            id: UUID(),
            name: courseName,
            credits: credits,
            category: selectedCategory,
            isCompleted: isCompleted,
            semester: courseSemester.isEmpty ? "Unknown" : courseSemester,
            grade: isCompleted ? Double(courseGrade) : nil
        )
    }
}
