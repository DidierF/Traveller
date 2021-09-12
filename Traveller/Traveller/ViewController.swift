//
//  ViewController.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    private lazy var locationList: UINavigationController = getNavigationVC(title: "Locations", rootVC: LocationListVC())

    private lazy var tripsList: UINavigationController = getNavigationVC(title: "Trips", rootVC: TripsListVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        delegate = self
        viewControllers = [
            locationList,
            tripsList
        ]
    }

    private func getNavigationVC(title: String, rootVC: UIViewController) -> UINavigationController {
        let navigator = UINavigationController(rootViewController: rootVC)
        navigator.tabBarItem.title = title
        return navigator
    }
}

