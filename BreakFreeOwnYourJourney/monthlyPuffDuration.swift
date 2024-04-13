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
    
    @State var rawSelectedMonth: Date? = nil
    @State var puffTracking: [PuffTrackingData]
    @Environment(\.calendar) var calendar
    
    func endOfMonth(for date: Date) -> Date {
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        return endOfMonth
    }
    
    var selectedMonth: Date? {
        if let rawSelectedMonth{
            let selectedMonth = calendar.component(.month, from: rawSelectedMonth)
            let selectedMonthDate = calendar.date(bySetting: .month, value: selectedMonth, of: rawSelectedMonth)
                        return selectedMonthDate
        }

        return nil
    }
        
    var body: some View {
        Chart(Array(calculateMinMaxPuffDuration(puffTrackingData: puffTracking)), id: \.key) { date,puffTrackingData in
            BarMark(
                x: .value("Date", dateDecode(date: date)!,unit: .month ),
                yStart: .value("Min Puff", puffTrackingData.min),
                yEnd: .value("Max Puff", puffTrackingData.max)
            )
            if let selectedMonth {
                RuleMark(
                    x: .value("Selected", selectedMonth, unit: .month)
                )
                .foregroundStyle(Color.gray.opacity(0.3))
                .annotation(
                    position: .automatic, spacing: 0,
                    overflowResolution: .init(
                        x: .fit(to: .chart),
                        y: .fit(to: .chart)
                    )
                ) {
                    selectionPopover
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 3600 * 24 * 365 )
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
        .chartXSelection(value: $rawSelectedMonth)
    }
    
    @ViewBuilder
    var selectionPopover: some View{
        if let selectedMonth{
            VStack(alignment: .leading){
                Text("Puff on \(selectedMonth, format: .dateTime.month().year())")
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.gray.opacity(0.12))
            }
        } else {
            EmptyView()
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

//#Preview {
//    monthlyPuffDuration()
//}
