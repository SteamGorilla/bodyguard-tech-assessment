//
//  DailyTableViewCell.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 17/03/2021.
//

import UIKit
import SnapKit

class DailyTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    private var weekday = UILabel()
    private var weatherIcon = UIImageView()
    private var maxTemperature = UILabel()
    private var minTemperature = UILabel()

    // MARK: - Properties
    var dailyWeatherData: Daily? {
        didSet {
            setupCellDatas(from: dailyWeatherData!)
        }
    }

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupUI() {

        // Weekday Label
        weekday.font = UIFont(name: "HelveticaNeue", size: 18.0)
        weekday.textColor = .white
        weekday.translatesAutoresizingMaskIntoConstraints = false
        weekday.adjustsFontSizeToFitWidth = false
        weekday.numberOfLines = 0
        self.addSubview(weekday)

        // Weather Icon
        self.addSubview(weatherIcon)

        // Max Temp Label
        maxTemperature.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        maxTemperature.textColor = .white
        maxTemperature.translatesAutoresizingMaskIntoConstraints = false
        maxTemperature.adjustsFontSizeToFitWidth = false
        maxTemperature.numberOfLines = 0
        self.addSubview(maxTemperature)

        // Min Temp Label
        minTemperature.font = UIFont(name: "HelveticaNeue", size: 18.0)
        minTemperature.textColor = .white
        minTemperature.translatesAutoresizingMaskIntoConstraints = false
        minTemperature.adjustsFontSizeToFitWidth = false
        minTemperature.numberOfLines = 0
        self.addSubview(minTemperature)
    }

    // MARK: - Constraints Setup
    private func setupConstraints() {
        weekday.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(25.0)
        }

        weatherIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        maxTemperature.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-75)
        }

        minTemperature.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-25.0)
        }
    }

    // MARK: - Data Setup
    private func setupCellDatas(from data: Daily) {
        weekday.text = TimeManager.getWeekDayFromTimestamp(timestamp: data.dt ?? 0)
        weatherIcon.image = IconManager.setIcon(from: data.weather?[0].icon ?? "")
        maxTemperature.text = "\(data.temp?.max?.toInt() ?? 0)°"
        minTemperature.text = "\(data.temp?.min?.toInt() ?? 0)°"
    }
}
