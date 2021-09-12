//
//  TripTableViewCell.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: TripTableViewCell.self)

    lazy var image: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.layer.cornerRadius = 10
        i.clipsToBounds = true
        return i
    }()

    lazy var destination: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font  = .systemFont(ofSize: 20)
        l.textAlignment = .left
        return l
    }()

    lazy var company: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font  = .systemFont(ofSize: 16)
        return l
    }()

    let star: UIImageView = RatingStar()

    lazy var rating: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.layer.shadowColor = UIColor.black.cgColor
        l.layer.shadowOpacity = 1
        l.font  = .systemFont(ofSize: 16)
        return l
    }()

    lazy var cost: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font  = .systemFont(ofSize: 16)
        l.textAlignment = .right
        return l
    }()

    let border: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear

        for v in subviews {
            v.removeFromSuperview()
        }

        addSubview(image)
        addSubview(rating)
        addSubview(star)
        image.addSubview(border)

        border.addSubview(company)
        border.addSubview(destination)
        border.addSubview(cost)

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 300),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            image.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            star.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            star.centerXAnchor.constraint(equalTo: rating.centerXAnchor),

            rating.topAnchor.constraint(equalTo: star.bottomAnchor, constant: 4),
            rating.rightAnchor.constraint(equalTo: image.rightAnchor, constant: -8),

            border.leftAnchor.constraint(equalTo: image.leftAnchor),
            border.rightAnchor.constraint(equalTo: image.rightAnchor),
            border.bottomAnchor.constraint(equalTo: image.bottomAnchor),

            destination.leftAnchor.constraint(equalTo: border.leftAnchor, constant: 8),
            destination.bottomAnchor.constraint(equalTo: border.bottomAnchor, constant: -8),

            company.leftAnchor.constraint(equalTo: destination.leftAnchor),
            company.bottomAnchor.constraint(equalTo: destination.topAnchor),
            company.topAnchor.constraint(equalTo: border.topAnchor, constant: 4),

            cost.rightAnchor.constraint(equalTo: border.rightAnchor, constant: -8),
            cost.centerYAnchor.constraint(equalTo: border.centerYAnchor),
            cost.leftAnchor.constraint(equalTo: destination.rightAnchor, constant: 4)
        ])
    }

    public func setupWithTrip(_ trip: Trip) {
        image.image = UIImage(named: trip.location.image)
        destination.text = trip.location.name
        company.text = trip.company.name
        rating.text = "\(trip.rating)"
        cost.text = "$\(trip.cost)"
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Coder init not implemented \(TripTableViewCell.identifier)")
    }
}
