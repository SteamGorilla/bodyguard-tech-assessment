//
//  WeatherModel.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 11/03/2021.
//

import Foundation

struct Weather: Codable {
    let current: Current?
    let daily: [Daily]?
    let hourly: [Hourly]?
}

struct Current: Codable {
    let dt: Int?
    let temp: Double?
    let weather: [WeatherConditions]
}

struct Daily: Codable {
    let dt: Int?
    let temp: Temperatures?
    let weather: [WeatherConditions]?
}

struct Hourly: Codable {
    let dt: Int
    let temp: Double?
    let weather: [WeatherConditions]?
}

struct WeatherConditions: Codable {
    let main: String?
    let customDescription: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case customDescription = "description"
        case main
        case icon
    }
}

struct Temperatures: Codable {
    let day: Double?
    let min: Double?
    let max: Double?
}
