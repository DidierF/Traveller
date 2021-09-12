//
//  LocationService.swift
//  Traveller
//
//  Created by Didier on 11/9/21.
//

import Foundation

class LocationService {

    func getLocations() -> [Location] {
        return [
            Location(name: "Test Location 1", image: "beach"),
            Location(name: "Test Location 2", image: "trail"),
            Location(name: "Test Location 3", image: "waterfall"),
            Location(name: "Test Location 4", image: "trail"),
            Location(name: "Test Location 5", image: "waterfall"),
            Location(name: "Test Location 6", image: "beach"),
        ]
    }
}
