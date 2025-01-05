//
//  SearchPresenter.swift
//  Home
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    func searchCities(with query: String)
    func firstAppear()
}

protocol SearchViewProtocol: AnyObject {
    func showCities(_ cities: [SearchResult])
    func showError(_ error: String)
    func showEmptyState()
}

class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?

    func searchCities(with query: String) {
        if query.isEmpty {
            view?.showEmptyState()
        } else {
            interactor?.searchCities(with: query)
        }
    }
    
    func firstAppear() {
        view?.showEmptyState()
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func didRetrieveCities(_ cities: [SearchResult]) {
        view?.showCities(cities)
    }

    func didFailWithError(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
}
