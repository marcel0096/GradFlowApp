//
//  MockModel.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import Foundation

public class MockModel {
    let student: Student
    public convenience init() {
        let mockCourses = [
            Course(id: UUID(),
                   name: "Advanced Topics of Software Engineering",
                   credits: 8,
                   category: StudyCategory.mandatoryInformatics,
                   isCompleted: true,
                   semester: "WS23",
                   grade: 2.0),
            Course(id: UUID(),
                   name: "Tech Challenge",
                   credits: 6,
                   category: StudyCategory.electiveManagement,
                   isCompleted: true,
                   semester: "WS23",
                   grade: 1.0),
            Course(id: UUID(),
                   name: "Web Application Engineering",
                   credits: 8,
                   category: StudyCategory.mandatoryInformationSystems,
                   isCompleted: true,
                   semester: "SS24",
                   grade: 1.3),
            Course(id: UUID(),
                   name: "iPraktikum",
                   credits: 10,
                   category: StudyCategory.practicalElective,
                   isCompleted: false,
                   semester: "SS24"),
            Course(id: UUID(),
                   name: "Lernen durch Lehren - Hackerschool",
                   credits: 3,
                   category: StudyCategory.supportElective,
                   isCompleted: true,
                   semester: "SS24",
                   grade: 1.0)
        ]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let mockStudent = Student(
            id: UUID(),
            matriculationNumber: "03724829",
            name: "Marcel Dietl",
            fieldOfStudy: "Information Systems, M.Sc.",
            startDate: dateFormatter.date(from: "2020-01-01") ?? Date(),
            courses: mockCourses
        )
        self.init(student: mockStudent)
    }
    init(student: Student) {
        self.student = student
    }
}
