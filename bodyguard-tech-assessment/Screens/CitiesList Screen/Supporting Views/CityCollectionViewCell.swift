//
//  CityCollectionViewCell.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 09/03/2021.
//

import Foundation
import UIKit
import SnapKit

class CityCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Elements
    private let city = UILabel()
    private let time = UILabel()
    private let weather = UIImageView()
    private let temperatures = UILabel()

    // MARK: - Properties

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupUI()
        setupConstraints()
        setupCellDatas()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {

    }

    // MARK: - UI Setup
    private func setupUI() {
        self.isUserInteractionEnabled = true

        // City Label
        city.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        city.textColor = .black
        city.translatesAutoresizingMaskIntoConstraints = false
        city.adjustsFontSizeToFitWidth = false
        city.numberOfLines = 0
        self.addSubview(city)

        // Time Label
        time.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        time.textColor = .black
        time.translatesAutoresizingMaskIntoConstraints = false
        time.adjustsFontSizeToFitWidth = false
        time.numberOfLines = 0
        self.addSubview(time)

        // Temperatures Label
        temperatures.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        temperatures.textColor = .black
        temperatures.translatesAutoresizingMaskIntoConstraints = false
        temperatures.adjustsFontSizeToFitWidth = false
        temperatures.numberOfLines = 0
        self.addSubview(temperatures)

        // Weather ImageView
        weather.image = UIImage(named: "Heavy Rain")
        self.addSubview(weather)
    }

    // MARK: - Constraints Setup
    private func setupConstraints() {
        city.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(Layout.left)
        }

        time.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(city.snp.right).offset(Layout.offset)
        }

        temperatures.snp.makeConstraints {
            $0.bottom.equalTo(Layout.bottom)
            $0.right.equalTo(Layout.right)
        }

        weather.snp.makeConstraints {
            $0.width.height.equalTo(60.0)
            $0.top.equalTo(Layout.top)
            $0.right.equalTo(Layout.right)
        }
    }

    // MARK: - Data Setup
    private func setupCellDatas(/*from data: T*/) {
        city.text = "Washington"
        time.text = "10:46"
        temperatures.text = "8° / 14°"
    }
}

extension CityCollectionViewCell {

    enum Layout {
        static let top: CGFloat = 18.0
        static let bottom: CGFloat = -18.0
        static let left: CGFloat = 15.0
        static let right: CGFloat = -15.0
        static let offset: CGFloat = 5.0
    }
}
