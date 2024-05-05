//
//  monthlyPuffDuration.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 11/04/24.
//

import SwiftUI
import SwiftData
import Charts


struct monthlyPuffDuration: View {
    
    @State private var puffTracking = sampleDataMonthly
        
    var body: some View {
        Chart{
            ForEach(Array(calculateMinMaxPuffDuration(puffTrackingData: puffTracking)), id: \.key) { date, puffTrackingData in
                BarMark(x: .value("Date", dateDecode(date: date)!), yStart: .value("Min Puff", puffTrackingData.min), yEnd: .value("Max Puff", puffTrackingData.max), width: 0.6)
            }
    }
    func dateDecode(date: String) -> Date? {
        // Decode dateKey back into a Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM,yyyy"
        if let decodedDate = dateFormatter.date(from: date) {
            // Use decodedDate
            print("Decoded date: \(decodedDate)")
            return decodedDate
        } else {
            print("Could not decode date")
        }
        return nil
    }
    func calculateMinMaxPuffDuration(puffTrackingData: [PuffTrackingData]) -> [String: (min: Double, max: Double)] {
            var minMaxPuffDuration: [String: (min: Double, max: Double)] = [:]
            
            // Iterate through the puff tracking data
            for data in puffTrackingData {
                
                let date = Calendar.current.dateComponents([.year, .month], from: data.date)
                let datekey = "\(date.month!),\(date.year! )"
                
                // Check if the date already exists in the dictionary
                if let existingMinMax = minMaxPuffDuration[datekey] {
                    // Update the minimum and maximum puff duration if necessary
                    let minPuffDuration = min(existingMinMax.min, data.puffDurationInMinutes)
                    let maxPuffDuration = max(existingMinMax.max, data.puffDurationInMinutes)
                    minMaxPuffDuration[datekey] = (minPuffDuration, maxPuffDuration)
                } else {
                    // Add the date to the dictionary with the initial puff duration values
                    minMaxPuffDuration[datekey] = (data.puffDurationInMinutes, data.puffDurationInMinutes)
                }
            }
            
            return minMaxPuffDuration
        }
}

#Preview {
    monthlyPuffDuration()
}
