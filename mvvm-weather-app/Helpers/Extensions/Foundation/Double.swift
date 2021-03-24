//
//  Double.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 14/03/2021.
//

import Foundation

extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
