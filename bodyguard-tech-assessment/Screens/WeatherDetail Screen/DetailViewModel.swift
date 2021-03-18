//
//  DetailViewModel.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 15/03/2021.
//

import Foundation

class DetailViewModel {

    // MARK: - Properties
    var weatherData: Weather
    var city: String

    // MARK: - Initialization
    init(weatherData: Weather, city: String) {
        self.weatherData = weatherData
        self.city = city
    }
}
