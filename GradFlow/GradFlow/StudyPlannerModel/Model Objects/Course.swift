//
//  Course.swift
//  GradFlow
//
//  Created by Marcel Dietl on 09.10.24.
//

import Foundation

public struct Course: Identifiable {
    /// The stable identity of the entity associated with self
    public var id: UUID?
    /// The name of the `Course`
    public var name: String
    /// The ECTS credit points of the `Course`
    public var credits: Int
    /// The study category of the `Course`
    public var category: StudyCategory
    /// Whether the `Course` is already completed or not
    public var isCompleted: Bool
    /// The semester in which the `Course` was completed or is planned
    public var semester: String
    /// The grade with which the `Course` was completed
    public var grade: Double?

    public init(id: UUID? = nil,
                name: String,
                credits: Int,
                category: StudyCategory,
                isCompleted: Bool,
                semester: String,
                grade: Double? = nil) {
        self.id = id
        self.name = name
        self.credits = credits
        self.category = category
        self.isCompleted = isCompleted
        self.semester = semester
        self.grade = grade
    }
}
