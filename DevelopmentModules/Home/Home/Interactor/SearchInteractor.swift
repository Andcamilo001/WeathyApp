//
//  SearchInteractor.swift
//  Home
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import NetworkInterface

protocol SearchInteractorInputProtocol: AnyObject {
    func searchCities(with query: String)
    func incrementFavoriteLocation(searchResults: [SearchResult])
}

protocol SearchInteractorOutputProtocol: AnyObject {
    func didRetrieveCities(_ cities: [SearchResult])
    func didFailWithError(_ error: Error)
}

class SearchInteractor: SearchInteractorInputProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    private let network: NetWorkInterface
    private let apiKey: String

    init(network: NetWorkInterface, apiKey: String) {
        self.network = network
        self.apiKey = apiKey
    }

    func searchCities(with query: String) {
        let url = "https://api.weatherapi.com/v1/search.json?key=\(apiKey)&q=\(query)"

        network.performRequest(
            url: url,
            method: .get,
            parameters: nil,
            headers: nil
        ) { (result: Result<[SearchResult], NetworkError>) in
            switch result {
            case .success(let cities):
                self.presenter?.didRetrieveCities(cities)
                self.incrementFavoriteLocation(searchResults: cities)
            case .failure(let error):
                self.presenter?.didFailWithError(error)
            }
        }
    }

    func incrementFavoriteLocation(searchResults: [SearchResult]) {
        var favoriteLocations = UserDefaults.standard.dictionary(forKey: "Favorites") as? [String: Int] ?? [:]
        
        for result in searchResults {
            let key = "\(result.name), \(result.country)"
            
            if let count = favoriteLocations[key] {
                favoriteLocations[key] = count + 1
            } else {
                favoriteLocations[key] = 1
            }
        }
        UserDefaults.standard.removeObject(forKey: "Favorites")
        UserDefaults.standard.set(favoriteLocations, forKey: "Favorites")
    }
}
