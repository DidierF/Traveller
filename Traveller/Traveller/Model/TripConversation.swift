//
//  TripConversation.swift
//  Traveller
//
//  Created by Didier on 12/9/21.
//

import Foundation

class TripConversation: Conversation {
    var trip: Trip

    init(trip: Trip) {
        self.trip = trip
    }
}
