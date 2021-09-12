//
//  LocationListVC.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class LocationListVC: UIViewController {

    let service = LocationService()

    var locations: [Location] = []

    lazy var tableView: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorColor = .clear
        t.backgroundColor = .clear
        t.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        t.dataSource = self
        t.delegate = self
        return t
    }()

    override func viewDidLoad() {
        let color: CGFloat = 0.95
        view.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1)
        title = "Locations"

        loadData()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }

    private func loadData() {
        locations = service.getLocations()
        tableView.reloadData()
    }
}

extension LocationListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as! LocationTableViewCell
        cell.setupWithLocation(locations[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
}
