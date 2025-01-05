//
//  FavoritesRouter.swift
//  Favorites
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import UIKit
import Coordinator

protocol FavoritesRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

public class FavoritesRouter: FavoritesRouterProtocol {
    weak var viewController: UIViewController?

    public static func createModule() -> UIViewController {
        let view = FavoritesViewController()
        let presenter = FavoritesPresenter()
        let interactor = FavoritesInteractor()
        let router = FavoritesRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view

        return view
    }
}
