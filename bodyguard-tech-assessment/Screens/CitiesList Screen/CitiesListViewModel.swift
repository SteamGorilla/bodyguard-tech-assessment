//
//  CitiesListViewModel.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 12/03/2021.
//

import Foundation

class CitiesListViewModel {

    var weathers: [Weather] = []
    let cities: [City] = Constants.cities
    let group = DispatchGroup()

    func getWeather() {
        for city in cities {
            group.enter()
            ApiService.fetchWeather(lat: city.lat, lon: city.lon) { [weak self] weather in
                self?.weathers.append(weather)
                self?.group.leave()
            }
        }
    }
}
