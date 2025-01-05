//
//  SearchRouter.swift
//  Home
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import UIKit
import NetworkWeathy
import Coordinator

protocol SearchRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

public class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    public static func createModule() -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(network: WeathyNetWork(), apiKey: "de5553176da64306b86153651221606")
        let router = SearchRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
