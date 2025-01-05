//
//  DescriptionInteractor.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import NetworkInterface

protocol DescriptionInteractorInputProtocol: AnyObject {
    func fetchDescription()
    func selectFavoriteLocation(name: String, country: String)
}

protocol DescriptionInteractorOutputProtocol: AnyObject {
    func didRetrieveDescription(_ description: DescriptionResult)
    func didFailWithError(_ error: Error)
}

class DescriptionInteractor: DescriptionInteractorInputProtocol {
    weak var presenter: DescriptionInteractorOutputProtocol?
    private let network: NetWorkInterface
    private let apiKey: String
    private let name: String

    init(network: NetWorkInterface, apiKey: String, name: String) {
        self.network = network
        self.apiKey = apiKey
        self.name = name
    }

    func fetchDescription() {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(name)&days=4"

        network.performRequest(
            url: url,
            method: .get,
            parameters: nil,
            headers: nil
        ) { (result: Result<DescriptionResult, NetworkError>) in
            switch result {
            case .success(let description):
                self.presenter?.didRetrieveDescription(description)
            case .failure(let error):
                self.presenter?.didFailWithError(error)
            }
        }
    }

    func selectFavoriteLocation(name: String, country: String) {
        let favoriteLocations = ["\(name), \(country)": 10000]
        UserDefaults.standard.set(favoriteLocations, forKey: "Favorites")
    }
}
