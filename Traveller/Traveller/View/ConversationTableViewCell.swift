//
//  ConversationTableViewCell.swift
//  Traveller
//
//  Created by Didier on 12/9/21.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {
    static let identifier = String(describing: ConversationTableViewCell.self)

    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        for v in subviews {
            v.removeFromSuperview()
        }

        addSubview(title)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
    }

    public func setupWithTitle(_ title: String) {
        self.title.text = title
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Coder init not implemented \(ConversationTableViewCell.identifier)")
    }
}
