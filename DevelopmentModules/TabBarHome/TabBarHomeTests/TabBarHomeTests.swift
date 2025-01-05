//
//  TabBarHomeTests.swift
//  TabBarHomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
import Home
import Favorites
import News
import SnapshotTesting
@testable import TabBarHome

class TabBarHomeTests: XCTestCase {
    
    var sut: TabBarHomeViewController!
    
    override func setUp() {
        super.setUp()
        sut = TabBarHomeViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_viewControllers_areCorrectlyConfigured() {
        // Ensure the number of view controllers is correct
        XCTAssertEqual(sut.viewControllers?.count, 4, "Expected 4 view controllers in the tab bar")
        
        // Ensure each view controller is of the correct type
        let homeVC = sut.viewControllers?[0] as? SearchViewController
        let favoritesVC = sut.viewControllers?[1] as? FavoritesViewController
        let newsVC = sut.viewControllers?[2] as? NewsViewController
        let logoutVC = sut.viewControllers?[3] as? LogoutSesionViewController
        
        XCTAssertNotNil(homeVC, "Home view controller should be of type SearchViewController")
        XCTAssertNotNil(favoritesVC, "Favorites view controller should be of type FavoritesViewController")
        XCTAssertNotNil(newsVC, "News view controller should be of type NewsViewController")
        XCTAssertNotNil(logoutVC, "Logout view controller should be of type LogoutSesionViewController")
    }
    
    func test_tabBarItems_areCorrectlyConfigured() {
        // Test the tab bar item titles and images
        XCTAssertEqual(sut.viewControllers?[0].tabBarItem.title, "Home", "Home tab bar title should be 'Home'")
        XCTAssertEqual(sut.viewControllers?[0].tabBarItem.image, UIImage(systemName: "house.fill"), "Home tab bar image should be 'house.fill'")
        
        XCTAssertEqual(sut.viewControllers?[1].tabBarItem.title, "Favorites", "Favorites tab bar title should be 'Favorites'")
        XCTAssertEqual(sut.viewControllers?[1].tabBarItem.image, UIImage(systemName: "star.fill"), "Favorites tab bar image should be 'star.fill'")
        
        XCTAssertEqual(sut.viewControllers?[2].tabBarItem.title, "News", "News tab bar title should be 'News'")
        XCTAssertEqual(sut.viewControllers?[2].tabBarItem.image, UIImage(systemName: "newspaper.fill"), "News tab bar image should be 'newspaper.fill'")
        
        XCTAssertEqual(sut.viewControllers?[3].tabBarItem.title, "Logout", "Logout tab bar title should be 'Logout'")
        XCTAssertEqual(sut.viewControllers?[3].tabBarItem.image, UIImage(systemName: "person.circle.fill"), "Logout tab bar image should be 'person.circle.fill'")
    }
    
    func test_tabBarAppearance_isConfiguredCorrectly() {
        XCTAssertFalse(sut.tabBar.isTranslucent, "Tab bar should not be translucent")
    }
    
    func test_delegate_isSet() {
        XCTAssertTrue(sut.delegate === sut, "TabBarHomeViewController should be its own delegate")
    }
    
    func test_snapshot_favorites_empty() {
        assertSnapshot(matching: sut, as: .image)
    }
}
