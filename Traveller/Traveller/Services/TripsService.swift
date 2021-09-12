//
//  TripsService.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import Foundation

class TripsService {

    public func getTrips() -> [Trip] {
        let company = Company()
        company.name = "Test Company"

        return [
            Trip(location: Location(name: "Location 1", image: "beach"), company: company),
            Trip(location: Location(name: "Location 2", image: "trail"), company: company),
            Trip(location: Location(name: "Location 3", image: "waterfall"), company: company),
        ]
    }
}
