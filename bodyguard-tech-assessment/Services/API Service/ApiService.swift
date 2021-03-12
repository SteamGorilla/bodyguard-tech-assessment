//
//  ApiService.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 09/03/2021.
//


// "https://api.openweathermap.org/data/2.5/onecall?lat=43,7&lon=7,25&units=metric&exclude=minutely,alerts&appid=8219743a0ed515df4bf3a76ff42e51fe"

import Foundation

class ApiService {

    private static let apiUrl = "https://api.openweathermap.org/data/2.5/onecall?"

    static func fetchWeather(lat: String, lon: String, completion: @escaping (Weather) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: "\(apiUrl)lat=\(lat)&lon=\(lon)&units=metric&exclude=minutely,alerts&appid=8219743a0ed515df4bf3a76ff42e51fe")!) { (data, _, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let weatherData = try jsonDecoder.decode(Weather.self, from: data)
                    completion(weatherData)
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
