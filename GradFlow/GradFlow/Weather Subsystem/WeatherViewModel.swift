//
//  WeatherViewModel.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import Foundation
import os

@Observable class WeatherViewModel {
    var weather: Weather?
    var error: Error?
    var errorDescription: String? {
        if let error = error as? URLError {
            switch error.code {
            case .badURL:
                logger.error("Invalid URL encountered.")
                return "The URL is invalid."
            case .notConnectedToInternet:
                logger.error("No internet connection.")
                return "No internet connection."
            case .timedOut:
                logger.error("The request timed out.")
                return "The request timed out."
            default:
                logger.error("An unexpected error occurred: \(error.localizedDescription).")
                return "An unexpected error occurred."
            }
        }
        return error?.localizedDescription
    }
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "Weather")

    private let endpointURLString =
        "https://api.weatherstack.com/current?access_key=<API-KEY>&query=Garching"

    init() {}

    func fetchWeather() async {
        logger.info("Fetching weather data...")

        guard let endpointURL = URL(string: endpointURLString) else {
            self.error = URLError(.badURL)
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: endpointURL)
            let weather = try JSONDecoder().decode(Weather.self, from: data)
            self.weather = weather
            logger.info("Weather data fetched successfully.")
        } catch {
            self.error = error
            logger.error("Failed to fetch weather data: \(error.localizedDescription).")
        }
    }
}
