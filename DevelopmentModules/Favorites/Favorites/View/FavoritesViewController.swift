//
//  FavoritesViewController.swift
//  Favorites
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import UIKit
import Coordinator

public class FavoritesViewController: UIViewController, FavoritesViewProtocol {
    var presenter: FavoritesPresenterProtocol?
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    private var favorites: [FavoritesLoad] = []
    private var coordinator = CoordinatorDescription.shared

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.firstAppear()
    }

    private func setupUI() {
        view.backgroundColor = .white

        headerLabel.text = "Favoritos"
        headerLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoritesCell.self, forCellReuseIdentifier: "FavoritesCell")

        view.addSubview(headerLabel)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func showCities(_ cities: [FavoritesLoad]) {
        self.favorites = cities
        tableView.isHidden = cities.isEmpty
        tableView.reloadData()

        if !cities.isEmpty {
            removeEmptyState()
        }
    }

    func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showEmptyState() {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "star.fill")
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .systemGray

        let emptyStateLabel = UILabel()
        emptyStateLabel.text = "Aún no tienes favoritos"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        emptyStateLabel.textColor = .systemGray

        let stackView = UIStackView(arrangedSubviews: [iconImageView, emptyStateLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        tableView.isHidden = true
    }

    private func removeEmptyState() {
        for subview in view.subviews where subview is UIStackView {
            subview.removeFromSuperview()
        }
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        cell.configure(with: favorites[indexPath.row])
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let firstKey = favorites[indexPath.row].favorite.keys.first else { return }
        let components = firstKey.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        coordinator.name(name: components[0])
        coordinator.navigation(navigation: true)
    }
}
