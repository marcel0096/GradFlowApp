//
//  Model.swift
//  GradFlow
//
//  Created by Marcel Dietl on 09.10.24.
//

import Foundation
import SwiftUI

@Observable public class Model {
    /// The `Student` of the GradFlow App
    public var student: Student

    public init(student: Student) {
        self.student = student
    }
}
