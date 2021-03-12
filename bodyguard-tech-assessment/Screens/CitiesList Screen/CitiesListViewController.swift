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

    // MARK: - Properties
    private var viewModel: CityListViewModel

    // MARK: - Initialization
    init(viewModel: CityListViewModel) {
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
    }

    // MARK: - UI setup
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.4980392157, blue: 0.9882352941, alpha: 1)

        // Cities CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.scrollDirection = .vertical

        citiesListCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        citiesListCollectionView.delegate = self
        citiesListCollectionView.dataSource = self
        citiesListCollectionView.backgroundColor = .clear
        citiesListCollectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: "CitiesListCollectionViewCell")

        view.addSubview(citiesListCollectionView)
    }

    // MARK: - Constraints setup
    private func setupConstraints() {
        citiesListCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - CollectionViewDataSource
extension CitiesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.cities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CitiesListCollectionViewCell", for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }

        cell.backgroundColor = .white
        cell.layer.borderColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.setShadow()

        return cell
    }
}

// MARK: - CollectionView Layout
extension CitiesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320.0, height: 130.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  30
    }
}
