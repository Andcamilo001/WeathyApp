//
//  DescriptionPresenter.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

protocol DescriptionPresenterProtocol: AnyObject {
    func fetchDescription()
    func selectFavoriteLocation(name: String, country: String)
}

protocol DescriptionViewProtocol: AnyObject {
    func showDescription(_ description: DescriptionResult)
    func showError(_ error: String)
    func showEmptyState()
}

class DescriptionPresenter: DescriptionPresenterProtocol {
    weak var view: DescriptionViewProtocol?
    var interactor: DescriptionInteractorInputProtocol?
    var router: DescriptionRouterProtocol?

    func fetchDescription() {
        interactor?.fetchDescription()
    }
    
    func selectFavoriteLocation(name: String, country: String) {
        interactor?.selectFavoriteLocation(name: name, country: country)
    }
    
}

extension DescriptionPresenter: DescriptionInteractorOutputProtocol {
    func didRetrieveDescription(_ description: DescriptionResult) {
        view?.showDescription(description)
    }

    func didFailWithError(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
}
