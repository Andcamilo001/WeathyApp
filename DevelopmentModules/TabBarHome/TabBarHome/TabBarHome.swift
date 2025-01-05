//
//  TabBarHome.swift
//  TabBarHome
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import UIKit
import Home
import Favorites
import News
import Description

public class TabBarHomeViewController: UITabBarController, UITabBarControllerDelegate {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarAppearance()
        self.delegate = self
    }

    private func setupTabBar() {
        let homeVC = SearchRouter.createModule()
        let favoritesVC = FavoritesRouter.createModule()
        let newsVC = NewsViewController()
        let logoutVC = LogoutSesionViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 2)
        logoutVC.tabBarItem = UITabBarItem(title: "Logout", image: UIImage(systemName: "person.circle.fill"), tag: 3)

        let viewControllers = [homeVC, favoritesVC, newsVC, logoutVC]
        self.viewControllers = viewControllers
    }
    
    private func setupTabBarAppearance() {
            tabBar.isTranslucent = false
        }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let favoritesVC = viewController as? FavoritesViewController {
            favoritesVC.viewDidLoad()
        }
    }
}
