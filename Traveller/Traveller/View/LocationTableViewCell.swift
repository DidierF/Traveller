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
        l.textColor = .white
        l.layer.shadowColor = UIColor.black.cgColor
        l.layer.shadowOpacity = 1
        l.font  = .systemFont(ofSize: 20)
        return l
    }()

    lazy var image: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.layer.cornerRadius = 10
        i.clipsToBounds = true
        return i
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        for v in subviews {
            v.removeFromSuperview()
        }

        addSubview(image)
        addSubview(title)

        NSLayoutConstraint.activate([

            image.heightAnchor.constraint(equalToConstant: 200),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            image.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            title.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -8),
            title.leftAnchor.constraint(equalTo: image.leftAnchor, constant: 8),
            title.rightAnchor.constraint(equalTo: image.rightAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Coder init not implemented \(LocationTableViewCell.identifier)")
    }

    func setupWithLocation(_ location: Location) {
        title.text = location.name
        image.image = UIImage(named: location.image)
    }
}
