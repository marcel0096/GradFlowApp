//
//  CourseAddView.swift
//  GradFlow
//
//  Created by Marcel Dietl on 09.10.24.
//

import SwiftUI
import AlertToast

struct CourseAddView: View {
    @Binding var student: Student
    @Binding var showSuccessAlert: Bool
    @State private var courseAddViewModel = CourseAddViewModel()
    @State private var selectedCategory = StudyCategory.mandatoryInformatics
    @State private var showErrorAlert = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Course Information") {
                    TextField("Course Name", text: $courseAddViewModel.courseName)
                    TextField("Credits (ECTS)", text: $courseAddViewModel.courseCredits).keyboardType(.numberPad)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(StudyCategory.allCategories) { category in
                            Text(category.name).tag(category)
                        }
                    }
                    TextField("Semester (e.g. SS23 or WS23)", text: $courseAddViewModel.courseSemester)
                    Toggle(isOn: $courseAddViewModel.isCompleted) { Text("Completed") }
                    if courseAddViewModel.isCompleted {
                        TextField("Grade", text: $courseAddViewModel.courseGrade).keyboardType(.decimalPad)
                    }
                }
            }
            .navigationTitle("Add Course")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let newCourse = courseAddViewModel.buildCourse(with: selectedCategory) {
                            student.courses.append(newCourse)
                            showSuccessAlert = true
                            dismiss()
                        } else {
                            showErrorAlert = true
                        }
                    }.alert("\(courseAddViewModel.errorMessage ?? "")", isPresented: $showErrorAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
        }.toast(isPresenting: $showSuccessAlert) {
            AlertToast(displayMode: .hud, type: .complete(.green), title: "Course added!")
        }
    }
}

#Preview {
    CourseAddView(student: .constant(MockModel().student), showSuccessAlert: .constant(false))
}
