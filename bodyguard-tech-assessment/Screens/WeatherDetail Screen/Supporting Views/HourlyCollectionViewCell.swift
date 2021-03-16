//
//  HourlyCollectionViewCell.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 16/03/2021.
//

import UIKit
import SnapKit

class HourlyCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Elements
    private var hourLabel = UILabel()
    private var weatherIcon = UIImageView()
    private var temperature = UILabel()

    // MARK: - Properties
    var hourlyWeatherData: Hourly? {
        didSet {
            setupCellDatas(from: hourlyWeatherData!)
        }
    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {

    }

    // MARK: - UI Setup
    private func setupUI() {
        hourLabel.font = UIFont(name: "HelveticaNeue", size: 18.0)
        hourLabel.textColor = .white
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.adjustsFontSizeToFitWidth = false
        hourLabel.numberOfLines = 0
        self.addSubview(hourLabel)

        self.addSubview(weatherIcon)

        temperature.font = UIFont(name: "HelveticaNeue", size: 18.0)
        temperature.textColor = .white
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.adjustsFontSizeToFitWidth = false
        temperature.numberOfLines = 0
        self.addSubview(temperature)

    }

    // MARK: - Constraints Setup
    private func setupConstraints() {
        hourLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(5.0)
        }

        weatherIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(25.0)
        }

        temperature.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-7.0)
        }
    }

    // MARK: - Data Setup
    private func setupCellDatas(from data: Hourly) {
        hourLabel.text = TimeManager.getTimeFromTimestamp(timestamp: data.dt, timezone: "Europe/Paris")
        weatherIcon.image = IconManager.setIcon(from: data.weather?[0].icon ?? "")
        temperature.text = "\(data.temp?.toInt() ?? 0)°"
    }
}
