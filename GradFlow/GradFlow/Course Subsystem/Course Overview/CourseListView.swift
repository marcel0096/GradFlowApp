//
//  ContentView.swift
//  GradFlow
//
//  Created by Marcel Dietl on 09.10.24.
//

import Foundation
import SwiftUI
import AlertToast

struct CourseListView: View {
    @Binding var student: Student
    @State private var courseAddViewModel = CourseAddViewModel()
    @State private var showSuccessAlert = false
    private let mockModel = MockModel()

    var body: some View {
        NavigationStack {
            VStack {
                if student.courses.isEmpty {
                    Text("To add a course, click on the plus symbol")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        let completedCourses = student.courses.filter { $0.isCompleted }
                        let plannedCourses = student.courses.filter { !$0.isCompleted }
                        Section(header: Text("Completed Courses") ) {
                            ForEach(completedCourses) { course in CourseCellView(course: course) }
                            .onDelete { offsets in student.courses.remove(atOffsets: offsets) }
                        }
                        Section(header: Text("Planned Courses") ) {
                            ForEach(plannedCourses) { course in CourseCellView(course: course) }
                            .onDelete { offsets in student.courses.remove(atOffsets: offsets) }
                        }
                    }
                }
            }
            .navigationTitle("Courses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { courseAddViewModel.showingAddCourse.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $courseAddViewModel.showingAddCourse) {
                CourseAddView(student: $student, showSuccessAlert: $showSuccessAlert)
            }
            .toast(isPresenting: $showSuccessAlert) {
                AlertToast(displayMode: .hud, type: .complete(.green), title: "Course added!")
            }
        }
    }
}

#Preview {
    CourseListView(student: .constant(MockModel().student))
}
