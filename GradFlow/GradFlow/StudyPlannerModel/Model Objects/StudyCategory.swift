//
//  StudyCategory.swift
//  GradFlow
//
//  Created by Marcel Dietl on 13.10.24.
//

import Foundation

public struct StudyCategory: Identifiable, Hashable {
    /// The stable identity of the category
    public var id: UUID
    /// The name of the category (e.g., "Mandatory Informatics", "Elective ML")
    public var name: String
    /// The minimum credit requirement for this category
    public var minCreditsRequired: Int

    public init(id: UUID = UUID(), name: String, minCreditsRequired: Int) {
        self.id = id
        self.name = name
        self.minCreditsRequired = minCreditsRequired
    }

    /// Predefined categories for study program Information Systems, M.Sc.
    public static let mandatoryInformatics = StudyCategory(name: "Mandatory Informatics",
                                                           minCreditsRequired: 8)
    public static let mandatoryInformationSystems = StudyCategory(name: "Mandatory Information Systems",
                                                                  minCreditsRequired: 13)
    public static let electiveML = StudyCategory(name: "Elective Data Analysis & ML",
                                                 minCreditsRequired: 5)
    public static let electiveDatabases = StudyCategory(name: "Elective Databases",
                                                        minCreditsRequired: 5)
    public static let electiveAlgorithms = StudyCategory(name: "Elective Algorithms",
                                                         minCreditsRequired: 5)
    public static let electiveIS = StudyCategory(name: "Elective Information Systems",
                                                 minCreditsRequired: 5)
    public static let electiveManagement = StudyCategory(name: "Elective Management",
                                                         minCreditsRequired: 18)
    public static let supportElective = StudyCategory(name: "Support Elective",
                                                      minCreditsRequired: 6)
    public static let practicalElective = StudyCategory(name: "Practical",
                                                        minCreditsRequired: 10)
    public static let thesis = StudyCategory(name: "Master Thesis",
                                             minCreditsRequired: 30)
    public static let allCategories: [StudyCategory] =
        [
            mandatoryInformatics,
            mandatoryInformationSystems,
            electiveML,
            electiveDatabases,
            electiveAlgorithms,
            electiveIS,
            electiveManagement,
            supportElective,
            practicalElective,
            thesis
        ]
}
