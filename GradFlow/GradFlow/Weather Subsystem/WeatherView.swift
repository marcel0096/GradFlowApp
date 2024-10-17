//
//  SwiftUIView.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import SwiftUI

struct WeatherView: View {
    @State private var weatherViewModel = WeatherViewModel()

    var body: some View {
        VStack {
            if let weather = weatherViewModel.weather {
                Text("\(weather.location.name), \(weather.location.country)")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 5)
                HStack {
                    Text("\(weather.current.temperature)°C")
                        .font(.title)
                        .foregroundColor(Color.gray)
                    if let iconURL = weather.current.weather_icons.first, URL(string: iconURL) != nil {
                        AsyncImage(url: URL(string: iconURL)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 64, height: 64)
                    }
                }
            } else if weatherViewModel.error != nil {
                Text("Failed to load weather data: \(weatherViewModel.errorDescription ?? "")").font(.custom("SF-Pro", size: 20)).foregroundColor(.primary)
            } else {
                ProgressView()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .task {
            await weatherViewModel.fetchWeather()
        }
    }
}

#Preview {
    WeatherView()
}
