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

var sampleDataMonthly : [PuffTrackingData] = [
    // January
        PuffTrackingData(
            date: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date(), // Adjust for January 2023
          numberOfPuff: 17,
          nicotineStrength: 13.0,
          puffDurationInMinutes: 4,
          additionalNotes: "Cold weather cravings"
        ),
        // February
        PuffTrackingData(
            date: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 1)) ?? Date(), // Adjust for February 2023 (consider leap year)
          numberOfPuff: 10,
          nicotineStrength: 12.5,
          puffDurationInMinutes: 3,
          additionalNotes: "Trying to cut down, feeling anxious"
        ),
        // March
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 1)) ?? Date(), // Adjust for March 2023
          numberOfPuff: 5,
          nicotineStrength: 10.0,
          puffDurationInMinutes: 2,
          additionalNotes: "Feeling more in control, using lower strength vape"
        ),
        // April
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 1)) ?? Date(), // Adjust for April 2023
          numberOfPuff: 8,
          nicotineStrength: 12.0,
          puffDurationInMinutes: 3,
          additionalNotes: "Feeling good, stress low"
        ),
        // May
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 1)) ?? Date(), // Adjust for May 2023
          numberOfPuff: 3,
          nicotineStrength: 10.0,
          puffDurationInMinutes: 1,
          additionalNotes: "Rare cravings, strong willpower"
        ),
        // June
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 1)) ?? Date(), // Adjust for June 2023
          numberOfPuff: 0,
          nicotineStrength: 0.0,
          puffDurationInMinutes: 0.0,
          additionalNotes: "Vaping-free for a month!"
        ),
        // July
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 1)) ?? Date(), // Adjust for July 2023
          numberOfPuff: 12,
          nicotineStrength: 15.6,
          puffDurationInMinutes: 6,
          additionalNotes: "Vacation, occasional puffing"
        ),
        // August
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 1)) ?? Date(), // Adjust for August 2023
          numberOfPuff: 6,
          nicotineStrength: 12.0,
          puffDurationInMinutes: 2,
          additionalNotes: "Stressful deadline, slight setback"
        ),
        // September
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 1)) ?? Date(), // Adjust for September 2023
          numberOfPuff: 6,
          nicotineStrength: 12.0,
          puffDurationInMinutes: 2,
          additionalNotes: "Stressful deadline, slight setback"
        ),
        // October
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 1)) ?? Date(), // Adjust for October 2023
          numberOfPuff: 0,
          nicotineStrength: 0.0,
          puffDurationInMinutes: 0.0,
          additionalNotes: "Vaping-free for a month!"
        ),
        // November
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 1)) ?? Date(), // Adjust for November 2023
          numberOfPuff: 12,
          nicotineStrength: 15.6,
          puffDurationInMinutes: 6,
          additionalNotes: "Vacation, occasional puffing"
        ),
        // December
        PuffTrackingData(
          date: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 1)) ?? Date(), // Adjust for December 2023
          numberOfPuff: 6,
          nicotineStrength: 12.0,
          puffDurationInMinutes: 2,
          additionalNotes: "Stressful deadline, slight setback"
        ),
        // January
            PuffTrackingData(
                date: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date(), // Adjust for January 2023
              numberOfPuff: 17,
              nicotineStrength: 13.0,
              puffDurationInMinutes: 14,
              additionalNotes: "Cold weather cravings"
            ),
            // February
            PuffTrackingData(
                date: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 1)) ?? Date(), // Adjust for February 2023 (consider leap year)
              numberOfPuff: 10,
              nicotineStrength: 12.5,
              puffDurationInMinutes: 13,
              additionalNotes: "Trying to cut down, feeling anxious"
            ),
            // March
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 1)) ?? Date(), // Adjust for March 2023
              numberOfPuff: 5,
              nicotineStrength: 10.0,
              puffDurationInMinutes: 12,
              additionalNotes: "Feeling more in control, using lower strength vape"
            ),
            // April
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 1)) ?? Date(), // Adjust for April 2023
              numberOfPuff: 8,
              nicotineStrength: 12.0,
              puffDurationInMinutes: 13,
              additionalNotes: "Feeling good, stress low"
            ),
            // May
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 1)) ?? Date(), // Adjust for May 2023
              numberOfPuff: 3,
              nicotineStrength: 10.0,
              puffDurationInMinutes: 11,
              additionalNotes: "Rare cravings, strong willpower"
            ),
            // June
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 1)) ?? Date(), // Adjust for June 2023
              numberOfPuff: 0,
              nicotineStrength: 0.0,
              puffDurationInMinutes: 0.0,
              additionalNotes: "Vaping-free for a month!"
            ),
            // July
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 1)) ?? Date(), // Adjust for July 2023
              numberOfPuff: 12,
              nicotineStrength: 15.6,
              puffDurationInMinutes: 16,
              additionalNotes: "Vacation, occasional puffing"
            ),
            // August
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 1)) ?? Date(), // Adjust for August 2023
              numberOfPuff: 6,
              nicotineStrength: 12.0,
              puffDurationInMinutes: 12,
              additionalNotes: "Stressful deadline, slight setback"
            ),
            // September
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 1)) ?? Date(), // Adjust for September 2023
              numberOfPuff: 6,
              nicotineStrength: 12.0,
              puffDurationInMinutes: 12,
              additionalNotes: "Stressful deadline, slight setback"
            ),
            // October
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 12)) ?? Date(), // Adjust for October 2023
              numberOfPuff: 0,
              nicotineStrength: 0.0,
              puffDurationInMinutes: 10.0,
              additionalNotes: "failed "
            ),
            // November
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 1)) ?? Date(), // Adjust for November 2023
              numberOfPuff: 12,
              nicotineStrength: 15.6,
              puffDurationInMinutes: 16,
              additionalNotes: "Vacation, occasional puffing"
            ),
            // December
            PuffTrackingData(
              date: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 1)) ?? Date(), // Adjust for December 2023
              numberOfPuff: 6,
              nicotineStrength: 12.0,
              puffDurationInMinutes: 12,
              additionalNotes: "Stressful deadline, slight setback"
            )
]
