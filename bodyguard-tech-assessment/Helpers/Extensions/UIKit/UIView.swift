//
//  UIView.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 09/03/2021.
//

import UIKit

extension UIView {
    /// Set a shadow of the bounds of the view
    /// - Parameters:
    ///
    ///   - color: The shadow color
    ///   - opacity: The shadow opacity
    ///   - offset: The shadow offset
        func setShadow(opacity: Float = 0.2, offset: CGSize = .zero, radius: CGFloat = 5) {
            layer.shadowColor = UIColor.darkGray.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offset
            layer.shadowRadius = radius
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        }
}
