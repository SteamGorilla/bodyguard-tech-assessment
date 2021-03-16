//
//  DetailViewController.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 15/03/2021.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    // MARK: - UI Elements
    private var city = UILabel()
    private var currentConditions = UILabel()
    private var weatherIcon = UIImageView()
    private var currentTemperature = UILabel()
    private var minMaxTemperature = UILabel()
    private var hourlyWeatherCollectionView = UICollectionView(withFlowLayout: true)

    // MARK: - Properties
    private var viewModel: DetailViewModel

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)

        setupUI()
        setupConstraints()
        setupData()
    }

    // MARK: - Initialization
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI setup
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.4980392157, blue: 0.9882352941, alpha: 1)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.view.backgroundColor = .clear

        // City Label
        city.font = UIFont(name: "HelveticaNeue-Bold", size: 52.0)
        city.textColor = .white
        city.translatesAutoresizingMaskIntoConstraints = false
        city.adjustsFontSizeToFitWidth = false
        city.numberOfLines = 0
        self.view.addSubview(city)

        // Current ConditionsLabel
        currentConditions.font = UIFont(name: "HelveticaNeue", size: 22.0)
        currentConditions.textColor = .white
        currentConditions.translatesAutoresizingMaskIntoConstraints = false
        currentConditions.adjustsFontSizeToFitWidth = false
        currentConditions.numberOfLines = 0
        self.view.addSubview(currentConditions)

        // Weather Icon
        weatherIcon.image = IconManager.setIcon(from: viewModel.weatherData.current?.weather[0].icon ?? "")
        self.view.addSubview(weatherIcon)

        // Current Temperature Label
        currentTemperature.font = UIFont(name: "HelveticaNeue-Bold", size: 52.0)
        currentTemperature.textColor = .white
        currentTemperature.translatesAutoresizingMaskIntoConstraints = false
        currentTemperature.adjustsFontSizeToFitWidth = false
        currentTemperature.numberOfLines = 0
        self.view.addSubview(currentTemperature)

        // Min Temperature Label
        minMaxTemperature.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        minMaxTemperature.textColor = .white
        minMaxTemperature.translatesAutoresizingMaskIntoConstraints = false
        minMaxTemperature.adjustsFontSizeToFitWidth = false
        minMaxTemperature.numberOfLines = 0
        self.view.addSubview(minMaxTemperature)

        // Hourly Weather CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .horizontal

        hourlyWeatherCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        hourlyWeatherCollectionView.delegate = self
        hourlyWeatherCollectionView.dataSource = self
        hourlyWeatherCollectionView.backgroundColor = .clear
        hourlyWeatherCollectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: "HourlyWeatherCollectionViewCell")
        hourlyWeatherCollectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(hourlyWeatherCollectionView)
    }

    // MARK: - Constraints setup
    private func setupConstraints() {
        city.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        currentConditions.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(city.snp.bottom).offset(10.0)
        }

        weatherIcon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(city.snp.bottom).offset(30.0)
            $0.width.height.equalTo(220.0)
        }

        currentTemperature.snp.makeConstraints {
            $0.top.equalTo(weatherIcon.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
        }

        minMaxTemperature.snp.makeConstraints {
            $0.top.equalTo(currentTemperature.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
        }

        hourlyWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(minMaxTemperature.snp.bottom).offset(20.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(105.0)
        }
    }

    // MARK: - Data setup
    private func setupData() {
        city.text = viewModel.city
        currentTemperature.text = "\(viewModel.weatherData.current?.temp?.toInt() ?? 0)°"
        minMaxTemperature.text = "Min. \(viewModel.weatherData.daily?[0].temp?.min?.toInt() ?? 0)° Max. \(viewModel.weatherData.daily?[0].temp?.max?.toInt() ?? 0)°"
        currentConditions.text = viewModel.weatherData.current?.weather[0].customDescription?.capitalizingFirstLetter() ?? ""
    }
}

// MARK: - CollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherCollectionViewCell",
                                                            for: indexPath) as? HourlyCollectionViewCell else { return UICollectionViewCell() }

        cell.hourlyWeatherData = viewModel.weatherData.hourly?[indexPath.item]

        return cell
    }
}

// MARK: - CollectionView Layout
extension DetailViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60.0, height: 105.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  15
    }
}

extension DetailViewController {

    enum Layout {
        static let top: CGFloat = 60.0
        static let bottom: CGFloat = -18.0
        static let left: CGFloat = 38.0
        static let right: CGFloat = -15.0
        static let offset: CGFloat = 5.0
    }
}
