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
    func setShadow(opacity: Float = 0.8, offset: CGSize = .zero, radius: CGFloat = 7) {
            layer.shadowColor = #colorLiteral(red: 0.01568627451, green: 0.2784313725, blue: 0.9764705882, alpha: 1)
            layer.shadowOpacity = opacity
            layer.shadowOffset = offset
            layer.shadowRadius = radius
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        }
}
