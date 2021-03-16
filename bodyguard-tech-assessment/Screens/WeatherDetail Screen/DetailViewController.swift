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
    private var weatherIcon = UIImageView()

    // MARK: - Properties
    private var viewModel: DetailViewModel
    

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)

        setupUI()
        setupConstraints()
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

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.view.backgroundColor = .clear

        // City Label
        city.font = UIFont(name: "HelveticaNeue-Bold", size: 32.0)
        city.textColor = .white
        city.translatesAutoresizingMaskIntoConstraints = false
        city.adjustsFontSizeToFitWidth = false
        city.numberOfLines = 0
        city.text = viewModel.city
        self.view.addSubview(city)

        // Weather Icon
        weatherIcon.image = IconManager.setIcon(from: viewModel.weatherData.current?.weather[0].icon ?? "")
        self.view.addSubview(weatherIcon)
    }

    // MARK: - Constraints setup
    private func setupConstraints() {
        city.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        weatherIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(260.0)
        }
    }
}

extension DetailViewController {

    enum Layout {
        static let top: CGFloat = 30.0
        static let bottom: CGFloat = -18.0
        static let left: CGFloat = 18.0
        static let right: CGFloat = -15.0
        static let offset: CGFloat = 5.0
    }
}
