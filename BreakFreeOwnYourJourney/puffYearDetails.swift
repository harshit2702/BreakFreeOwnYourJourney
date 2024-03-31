//
//  puffYearDetails.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import Charts

struct puffYearDetails: View {
    
    @Binding var rawSelectedDate: Date?
    @Environment(\.calendar) var calendar
    @Environment(\.colorScheme) var colorScheme
    @Binding var scrollPositionStartY: Date
    
    var Data: [PuffTrackingData]
    
    func endOfMonth(for date: Date) -> Date {
        calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    var selectedMonth: Date? {
        if let rawSelectedDate {
            return Data.first(where: {
                let endOfDay = endOfMonth(for: $0.date)
                
                return ($0.date ... endOfDay).contains(rawSelectedDate)
            })?.date
        }
        
        return nil
    }

    var body: some View {
        Chart(Data) { puff in
            BarMark(
                x: .value("Day", puff.date,unit: .month),
                y: .value("Number of puff", puff.numberOfPuff),
                width: .ratio(0.6)
            )
            if let selectedMonth {
                RuleMark(
                    x: .value("Selected", selectedMonth, unit: .month)
                )
                .foregroundStyle(Color.red.opacity(0.3))
                
            }

        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 3600 * 24 * 365 )
        .chartXAxis {
            AxisMarks(values: .stride(by: .month, count: 1)) {
                AxisTick()
                AxisGridLine()
                AxisValueLabel(format: .dateTime.month())
            }
        }
        .chartScrollPosition(x: $scrollPositionStartY)
        .chartXSelection(value: $rawSelectedDate)


    }
}

//#Preview {
//    puffYearDetails()
//}
