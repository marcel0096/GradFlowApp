//
//  Weather.swift
//  GradFlow
//
//  Created by Marcel Dietl on 10.10.24.
//

import Foundation

struct Weather: Codable {
    let location: Location
    let current: CurrentWeather

    struct Location: Codable {
        let name: String
        let country: String
    }

    struct CurrentWeather: Codable {
        let temperature: Int
        let weather_icons: [String]
    }
}
