//
//  RatingStar.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import UIKit

class RatingStar: UIImageView {
    init() {
        super.init(image: UIImage(named: "rating")?.withRenderingMode(.alwaysTemplate))
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor),
            widthAnchor.constraint(equalToConstant: 16)
        ])
        tintColor = .white
    }

    required init?(coder: NSCoder) {
        print("Coder init not implemented RatingStar")
    }
}
