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

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }

    // MARK: - UI setup
    private func setupUI() {
        view.backgroundColor = .white

        // Cities CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.scrollDirection = .vertical

        citiesListCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        citiesListCollectionView.delegate = self
        citiesListCollectionView.dataSource = self
        citiesListCollectionView.backgroundColor = .white
        citiesListCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CitiesListCollectionViewCell")

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
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CitiesListCollectionViewCell", for: indexPath)

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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 160.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  20
    }
}
