//
//  LocationListVC.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class LocationListVC: UIViewController {

    let service = LocationService()

    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Locations"
    }
}
