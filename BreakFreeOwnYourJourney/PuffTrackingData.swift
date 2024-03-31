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

enum timeRange{
    case week,month,year
}



var sampleData: [PuffTrackingData] = [
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 32)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 33)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 34)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 27)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 26)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 25)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 24)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 23)), numberOfPuff: 10, nicotineStrength: 15.6, puffDurationInMinutes: 5, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 22)), numberOfPuff: 12, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: "Feeling stressed at work"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 21)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 20)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 19)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 18)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 17)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 16)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 15)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 14)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 13)), numberOfPuff: 10, nicotineStrength: 15.6, puffDurationInMinutes: 5, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 12)), numberOfPuff: 12, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: "Feeling stressed at work"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 11)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 10)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 9)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 8)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 7)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 6)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 5)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 4)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 3)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 2)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 1)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
  PuffTrackingData(date: Date(), numberOfPuff: 19, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes")
]
