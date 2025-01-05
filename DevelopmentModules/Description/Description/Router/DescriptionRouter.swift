//
//  DescriptionRouter.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import UIKit
import NetworkWeathy

public protocol DescriptionRouterProtocol: AnyObject {
    static func createModule(name: String) -> UIViewController
}

public class DescriptionRouter: DescriptionRouterProtocol {
    weak var viewController: UIViewController?
    
    public static func createModule(name: String) -> UIViewController {
        let view = DescriptionViewController()
        let presenter = DescriptionPresenter()
        let interactor = DescriptionInteractor(network: WeathyNetWork(),
                                               apiKey: "de5553176da64306b86153651221606",
                                               name: name)
        let router = DescriptionRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
