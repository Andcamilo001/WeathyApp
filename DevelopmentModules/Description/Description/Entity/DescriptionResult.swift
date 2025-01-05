//
//  DescriptionResult.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

struct DescriptionResult: Codable {
    let current: Current
    let location: LocationResult
    let forecast: Forecast
}

struct Current: Codable {
    let tempC: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
    }
}

struct Condition: Codable {
    let text: String
    let icon: String
}

struct Day: Codable {
    let avgtempC: Double
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case condition
    }
}

struct Forecastday: Codable {
    let day: Day
    let date: String
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct LocationResult: Codable {
    let country: String
    let lon: Double
    let lat: Double
    let name: String
}
