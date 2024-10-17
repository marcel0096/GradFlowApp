//
//  Student.swift
//  GradFlow
//
//  Created by Marcel Dietl on 11.10.24.
//

import Foundation

public struct Student: Identifiable {
    /// The stable identity of the entity associated with self
    public var id: UUID?
    /// Matriculation number of the `Student`
    public var matriculationNumber: String
    /// The name of the `Student`
    public var name: String
    /// The study program of the `Student`
    public var fieldOfStudy: String
    /// The start date for the study program
    public var startDate: Date
    /// The courses of the `Student`
    public var courses: [Course]
    /// Computed property that formats the start date into a readble format
    public var startDateDescription: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: startDate)
    }
    /// The number of credits the `Student` has collected so far
    public var currentCredits: Int {
        var credits: Int = 0
        for course in courses where course.isCompleted {
            credits += course.credits
        }
        return credits
    }
    /// The current GPA of the `Student`
    public var currentGPA: Double {
        var gpa: Double = 0
        for course in courses where course.isCompleted {
            gpa += (course.grade ?? 0.0) * Double(course.credits)
        }
        return gpa / Double(currentCredits)
    }
    /// Credits per `StudyCategory`
    public var creditsPerCategory: [StudyCategory: Int] {
        var categoryCredits: [StudyCategory: Int] = [:]
        for course in courses where course.isCompleted {
            categoryCredits[course.category, default: 0] += course.credits
        }
        return categoryCredits
    }

    ///GPA per `StudyCategory`
    public var gpaPerCategory: [StudyCategory: Double] {
        var categoryPoints: [StudyCategory: Double] = [:]
        var categoryCredits: [StudyCategory: Int] = [:]

        for course in courses where course.isCompleted {
            categoryPoints[course.category, default: 0.0] += (course.grade ?? 0.0) * Double(course.credits)
            categoryCredits[course.category, default: 0] += course.credits
        }

        var categoryGPA: [StudyCategory: Double] = [:]
        for (category, points) in categoryPoints {
            let credits = categoryCredits[category] ?? 0
            categoryGPA[category] = credits > 0 ? points / Double(credits) : 0.0
        }
        return categoryGPA
    }

    public init(id: UUID? = nil,
                matriculationNumber: String,
                name: String,
                fieldOfStudy: String,
                startDate: Date,
                courses: [Course] = []) {
        self.id = id
        self.matriculationNumber = matriculationNumber
        self.name = name
        self.fieldOfStudy = fieldOfStudy
        self.startDate = startDate
        self.courses = courses
    }
}
