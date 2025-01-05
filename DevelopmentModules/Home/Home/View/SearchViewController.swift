//
//  SearchViewController.swift
//  Home
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import UIKit
import Coordinator

public class SearchViewController: UIViewController, SearchViewProtocol {
    var presenter: SearchPresenterProtocol?
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private var cities: [SearchResult] = []
    private var debounceTimer: Timer?
    private var coordinator = CoordinatorDescription.shared

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.firstAppear()
    }

    private func setupUI() {
        searchBar.delegate = self
        searchBar.placeholder = "Busca tu ubicación"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityCell")
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    func showCities(_ cities: [SearchResult]) {
        self.cities = cities
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
        iconImageView.image = UIImage(systemName: "map.fill")
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .systemGray
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        let emptyStateLabel = UILabel()
        emptyStateLabel.text = "Busca tu ubicación"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        emptyStateLabel.textColor = .systemGray
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false

        let emptyStateStack = UIStackView(arrangedSubviews: [iconImageView, emptyStateLabel])
        emptyStateStack.axis = .vertical
        emptyStateStack.spacing = 16
        emptyStateStack.alignment = .center
        emptyStateStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(emptyStateStack)

        NSLayoutConstraint.activate([
            emptyStateStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        tableView.isHidden = true
    }
    
    private func removeEmptyState() {
        for subview in view.subviews {
            if subview is UIStackView {
                subview.removeFromSuperview()
            }
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
            self?.presenter?.searchCities(with: searchText)
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        let city = cities[indexPath.row]
        cell.configure(with: city)
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = cities[indexPath.row].name
        coordinator.name(name: name)
        coordinator.navigation(navigation: true)
    }
}
