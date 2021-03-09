//
//  UICollectionView.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 09/03/2021.
//

import UIKit

extension UICollectionView {

    /// Convenience init to prevent having to specify one UICollectionViewFlowLayout
    /// - Parameter withFlowLayout: Should init with an empty UICollectionViewFlowLayout
    convenience init(withFlowLayout: Bool) {
        if withFlowLayout {
            self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        } else {
            self.init(frame: .zero)
        }
    }

}
