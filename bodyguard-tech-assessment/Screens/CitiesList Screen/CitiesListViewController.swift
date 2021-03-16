//
//  CitiesListViewController.swift
//  bodyguard-tech-assessment
//
//  Created by Jeremy Papay on 09/03/2021.
//

import UIKit
import SnapKit

class CitiesListViewController: UIViewController {

    // MARK: - UI Elements
    private var citiesListCollectionView = UICollectionView(withFlowLayout: true)
    private var activityIndicator = UIActivityIndicatorView()

    // MARK: - Properties
    private var viewModel: CitiesListViewModel

    // MARK: - Initialization
    init(viewModel: CitiesListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        setupObservers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        viewModel.getWeather()
    }

    // MARK: - UI setup
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.4980392157, blue: 0.9882352941, alpha: 1)

        // Cities CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        layout.scrollDirection = .vertical

        citiesListCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        citiesListCollectionView.delegate = self
        citiesListCollectionView.dataSource = self
        citiesListCollectionView.backgroundColor = .clear
        citiesListCollectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: "CitiesListCollectionViewCell")

        view.addSubview(citiesListCollectionView)

        // Activity Indicator
        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
    }

    // MARK: - Constraints setup
    private func setupConstraints() {
        citiesListCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Observers setup
    private func setupObservers() {
        viewModel.weathers.bind(self) { [weak self] _ in

            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true

                self?.citiesListCollectionView.reloadData()
            }
        }
    }
}

// MARK: - CollectionViewDataSource
extension CitiesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weathers.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CitiesListCollectionViewCell", for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }

        cell.backgroundColor = .white
        cell.layer.borderColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.setShadow()

        cell.id = indexPath.item
        cell.weatherData = viewModel.weathers.value[indexPath.item]
        cell.cityData = viewModel.cities[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewModel = DetailViewModel(weatherData: viewModel.weathers.value[indexPath.item],
                                              city: viewModel.cities[indexPath.item].name)

        self.navigationController?.pushViewController(DetailViewController(viewModel: detailViewModel), animated: true)
    }
}

// MARK: - CollectionView Layout
extension CitiesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340.0, height: 115.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  15
    }
}
