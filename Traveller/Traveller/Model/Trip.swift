//
//  Trip.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import Foundation

class Trip {
    var location: Location
    var company: Company

    var rating = 0.0
    var date = Date()
    var cost = 0

    init(location: Location, company: Company) {
        self.location = location
        self.company = company
    }
}
