//
//  ChatsVC.swift
//  Traveller
//
//  Created by Didier on 12/9/21.
//

import UIKit

class ChatVC: UIViewController {

    private enum ChatMode {
        case trip
        case destination
    }

    private var chatMode: ChatMode = .trip

    let tripChats: [TripConversation] = []
    let destinationChats: [LocationConversation] = []

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

    let topSelector: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white

        let border = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        v.addSubview(border)
        NSLayoutConstraint.activate([
            border.heightAnchor.constraint(equalToConstant: 1),
            border.leftAnchor.constraint(equalTo: v.leftAnchor),
            border.rightAnchor.constraint(equalTo: v.rightAnchor),
            border.bottomAnchor.constraint(equalTo: v.bottomAnchor)
        ])

        return v
    }()

    lazy var tripsButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Trips", for: .normal)
        b.addTarget(self, action: #selector(onTripsPress), for: .touchUpInside)
        b.setTitleColor(.blue, for: .normal)
        return b
    }()

    lazy var destinationsButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Destinations", for: .normal)
        b.addTarget(self, action: #selector(onDestinationPress), for: .touchUpInside)
        b.setTitleColor(.black, for: .normal)
        return b
    }()

    override func viewDidLoad() {
        let color: CGFloat = 0.95
        view.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1)

        title = "Chats"

        view.addSubview(tableView)
        view.addSubview(topSelector)

        let container = UIStackView(arrangedSubviews: [tripsButton, destinationsButton])
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .fill
        container.axis = .horizontal
        container.distribution = .fillEqually

        topSelector.addSubview(container)

        NSLayoutConstraint.activate([
            topSelector.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topSelector.leftAnchor.constraint(equalTo: view.leftAnchor),
            topSelector.rightAnchor.constraint(equalTo: view.rightAnchor),
            topSelector.heightAnchor.constraint(equalToConstant: 50),

            tableView.topAnchor.constraint(equalTo: topSelector.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            container.leftAnchor.constraint(equalTo: topSelector.leftAnchor),
            container.rightAnchor.constraint(equalTo: topSelector.rightAnchor),
            container.topAnchor.constraint(equalTo: topSelector.topAnchor),
            container.bottomAnchor.constraint(equalTo: topSelector.bottomAnchor),
        ])
    }

    @objc private func onTripsPress() {
        toggleMode(.trip)
        tripsButton.setTitleColor(.blue, for: .normal)
        destinationsButton.setTitleColor(.black, for: .normal)
    }

    @objc private func onDestinationPress() {
        toggleMode(.destination)
        destinationsButton.setTitleColor(.blue, for: .normal)
        tripsButton.setTitleColor(.black, for: .normal)
    }

    private func toggleMode(_ mode: ChatMode) {
        chatMode = mode
        tableView.reloadData()
    }
}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch chatMode {
        case .trip:
            return tripChats.count
        case .destination:
            return destinationChats.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch chatMode {
        case .trip:
            return getTripCell(for: tableView, at: indexPath)
        case .destination:
            return getDestinationCell(for: tableView, at: indexPath)
        }
    }

    private func getTripCell(for tableView: UITableView, at indexPath: IndexPath) -> ConversationTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationTableViewCell.identifier, for: indexPath) as! ConversationTableViewCell
        cell.setupWithTitle(tripChats[indexPath.row].title)
        return cell
    }

    private func getDestinationCell(for tableView: UITableView, at indexPath: IndexPath) -> ConversationTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationTableViewCell.identifier, for: indexPath) as! ConversationTableViewCell
        cell.setupWithTitle(destinationChats[indexPath.row].title)
        return cell
    }
}
