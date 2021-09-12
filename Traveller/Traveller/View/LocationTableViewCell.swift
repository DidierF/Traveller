//
//  LocationTableViewCell.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: LocationTableViewCell.self)

    lazy var title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        for v in subviews {
            v.removeFromSuperview()
        }

        addSubview(title)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Coder init not implemented \(LocationTableViewCell.identifier)")
    }

    func setupWithLocation(_ location: Location) {
        title.text = location.name
    }
}
