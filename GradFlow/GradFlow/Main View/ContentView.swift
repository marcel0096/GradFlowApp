//
//  Navigation.swift
//  GradFlow
//
//  Created by Marcel Dietl on 11.10.24.
//

import SwiftUI

struct ContentView: View {
    @State private var student = MockModel().student

    var body: some View {
        TabView {
            DashboardView(student: $student)
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Dashboard")
                }

            CourseListView(student: $student)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Courses")
                }
        }
    }
}

#Preview {
    ContentView()
}
