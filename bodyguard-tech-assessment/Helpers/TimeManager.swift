//
//  TimeManager.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 14/03/2021.
//

import Foundation

class TimeManager {
    static func getTimeFromTimestamp(timestamp: Double, timezone: String) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short 
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeZone = TimeZone(identifier: timezone)
        dateFormatter.locale = Locale.autoupdatingCurrent
        let localDate = dateFormatter.string(from: date)
        print(localDate)

        return localDate
    }
}
