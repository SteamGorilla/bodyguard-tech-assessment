//
//  CitiesListViewModel.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 12/03/2021.
//

import Foundation
import UIKit

class CitiesListViewModel {

    var weathers: Dynamic<[Weather]> = Dynamic([])
    let cities: [City] = Constants.cities
    let group = DispatchGroup()
    let dispatchQueue = DispatchQueue(label: "weather")
    let dispatchSemaphore = DispatchSemaphore(value: 0)

    func getWeather() {
        var weathersArray: [Weather] = []

        dispatchQueue.async {
            for city in self.cities {
                self.group.enter()
                ApiService.fetchWeather(lat: city.lat, lon: city.lon) { [weak self] weather in
                    weathersArray.append(weather)
                    self?.dispatchSemaphore.signal()
                    self?.group.leave()
                }
                self.dispatchSemaphore.wait()
            }
        }

        self.group.notify(queue: self.dispatchQueue) { [weak self] in
            self?.weathers.value = weathersArray
        }
    }
}
