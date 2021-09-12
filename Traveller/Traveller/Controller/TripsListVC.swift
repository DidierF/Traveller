//
//  TripsListVC.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class TripsListVC: UIViewController {

    var trips: [Trip] = []

    let service = TripsService()

    lazy var tableView: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorColor = .clear
        t.backgroundColor = .clear
        t.register(TripTableViewCell.self, forCellReuseIdentifier: TripTableViewCell.identifier)
        t.dataSource = self
        t.delegate = self
        return t
    }()

    override func viewDidLoad() {
        let color: CGFloat = 0.95
        view.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1)

        loadData()
        setupNavbar()

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func setupNavbar() {
        title = "Trips"

        let chatButton = UIBarButtonItem(image: UIImage(named: "chat")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(onChatPress))
        chatButton.tintColor = .black
        navigationItem.rightBarButtonItems = [chatButton]
    }

    private func loadData() {
        trips = service.getTrips()
        tableView.reloadData()
    }

    @objc private func onChatPress() {
        let vc = ChatVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TripsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        cell.setupWithTrip(trips[indexPath.row])
        return cell
    }


}
