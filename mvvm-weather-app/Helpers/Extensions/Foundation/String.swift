//
//  String.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 14/03/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
