import SwiftUI

struct DashboardView: View {
    @Binding var student: Student

    var body: some View {
        VStack(spacing: 20) {
            Text("\(student.fieldOfStudy)")
                .font(.title)
                .bold()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding(.top, 90)

            // Overview Section
            VStack(alignment: .leading) {
                Text("Overview").font(.headline).padding(.bottom, 5)
                GeneralStatisticsView(student: $student)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }.padding(.horizontal, 20)

            // Detailed Statistics Section
            VStack(alignment: .leading) {
                Text("Detailed Statistics").font(.headline).padding(.bottom, 5)
                DetailedStatisticsView(student: $student)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .frame(height: (201))
            }.padding(.horizontal, 20)

            // Weather Section
            VStack(alignment: .leading) {
                Text("Campus weather").font(.headline).padding(.bottom, 5)
                WeatherView()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }.padding(.horizontal, 20)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    DashboardView(student: .constant(MockModel().student))
}
