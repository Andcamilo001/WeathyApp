//
//  DescriptionViewController.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import UIKit

public class DescriptionViewController: UIViewController {
    var presenter: DescriptionPresenterProtocol?

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .blue
        return button
    }()

    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let carouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 250)
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private var forecastDays: [Forecastday] = []
    private var locationName = ""
    private var country = ""

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
        presenter?.fetchDescription()
    }

    private func setupUI() {
        // Header
        let headerStackView = UIStackView(arrangedSubviews: [headerLabel, favoriteButton])
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8

        // Add subviews
        view.addSubview(headerStackView)
        view.addSubview(infoStackView)
        view.addSubview(carouselCollectionView)

        // Set constraints
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            carouselCollectionView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 162),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 250)
        ])

        // Configure favorite button action
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)

        // Configure collection view
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.register(ForecastCardCell.self, forCellWithReuseIdentifier: ForecastCardCell.identifier)
    }

    func updateView(location: LocationResult, forecastDays: [Forecastday]) {
        self.locationName = location.name
        self.country = location.country
        self.forecastDays = forecastDays

        headerLabel.text = location.name
        favoriteButton.setImage(
            UIImage(systemName: isFavorite(location: location) ? "star.fill" : "star"),
            for: .normal
        )

        infoStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        infoStackView.addArrangedSubview(makeInfoLabel(text: "Nombre: \(location.name)"))
        infoStackView.addArrangedSubview(makeInfoLabel(text: "País: \(location.country)"))
        infoStackView.addArrangedSubview(makeInfoLabel(text: "Latitud: \(location.lat) Longitud: \(location.lon)"))

        carouselCollectionView.reloadData()
    }

    private func makeInfoLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }

    @objc private func toggleFavorite() {
        var favorites = UserDefaults.standard.dictionary(forKey: "Favorites") as? [String: Int] ?? [:]
     
        let locationKey = "\(locationName), \(country)"
        
        if favorites[locationKey] != nil {
            favorites.removeValue(forKey: locationKey)
            UserDefaults.standard.set(favorites, forKey: "Favorites")
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            favorites[locationKey] = 10000
            UserDefaults.standard.set(favorites, forKey: "Favorites")
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }

    private func isFavorite(location: LocationResult) -> Bool {
        let favorites = UserDefaults.standard.dictionary(forKey: "Favorites") ?? [:]
        return favorites["\(location.name), \(location.country)"] != nil
    }
}

extension DescriptionViewController: DescriptionViewProtocol {
    func showDescription(_ description: DescriptionResult) {
        updateView(location: description.location, forecastDays: description.forecast.forecastday)
    }

    func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showEmptyState() {
        let alert = UIAlertController(title: "No Data", message: "No se encontraron datos.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension DescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastDays.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCardCell.identifier, for: indexPath) as? ForecastCardCell else {
            return UICollectionViewCell()
        }
        let forecastDay = forecastDays[indexPath.row]
        cell.configure(with: forecastDay)
        return cell
    }
}
