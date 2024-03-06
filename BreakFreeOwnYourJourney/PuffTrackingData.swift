//
//  PuffTrackingData.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import Foundation
import SwiftData

@Model
class PuffTrackingData: Identifiable{
    var id: UUID
    var date: Date
    var numberOfPuff: Int
    var nicotineStrength: Double
    var puffDurationInMinutes: Double
    var additionalNotes: String
    
    init(id: UUID = UUID(), date: Date = Date(), numberOfPuff: Int = 0, nicotineStrength: Double = 0.0 , puffDurationInMinutes: Double = 0.0, additionalNotes: String = "") {
        self.id = id
        self.date = date
        self.numberOfPuff = numberOfPuff
        self.nicotineStrength = nicotineStrength
        self.puffDurationInMinutes = puffDurationInMinutes
        self.additionalNotes = additionalNotes
    }
    
    
}

