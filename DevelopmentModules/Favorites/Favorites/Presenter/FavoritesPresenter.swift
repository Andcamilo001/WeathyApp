//
//  FavoritesPresenter.swift
//  Favorites
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

protocol FavoritesPresenterProtocol: AnyObject {
    func searchCities(with query: String)
    func firstAppear()
}

protocol FavoritesViewProtocol: AnyObject {
    func showCities(_ cities: [FavoritesLoad])
    func showError(_ error: String)
    func showEmptyState()
}

class FavoritesPresenter: FavoritesPresenterProtocol {
    weak var view: FavoritesViewProtocol?
    var interactor: FavoritesInteractorInputProtocol?
    var router: FavoritesRouterProtocol?

    func searchCities(with query: String) {
        guard let favorites = interactor?.loadFavorites() else {
            view?.showError("Error al cargar los favoritos")
            return
        }
        let filtered = favorites.filter { $0.key.lowercased().contains(query.lowercased()) }
        if filtered.isEmpty {
            view?.showEmptyState()
        } else {
            let favoritesLoad = filtered.map { FavoritesLoad(favorite: [$0.key: $0.value]) }
            view?.showCities(favoritesLoad)
        }
    }

    func firstAppear() {
        guard let favorites = interactor?.loadFavorites() else {
            view?.showError("Error al cargar los favoritos")
            return
        }
        if favorites.isEmpty {
            view?.showEmptyState()
        } else {
            let favoritesLoad = favorites.map { FavoritesLoad(favorite: [$0.key: $0.value]) }
            view?.showCities(favoritesLoad)
        }
    }
}
