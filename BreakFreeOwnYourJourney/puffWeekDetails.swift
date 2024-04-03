//
//  puffWeekDetails.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import Charts
import SwiftData

struct puffWeekDetails: View {
    
    @Binding var rawSelectedDate: Date?
    @Environment(\.calendar) var calendar
    @Environment(\.colorScheme) var colorScheme
    @Binding var scrollPositionStart: Date
    
    var Data: [PuffTrackingData]
    
    func endOfDay(for date: Date) -> Date {
        calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    var selectedDate: Date? {
        if let rawSelectedDate {
            return rawSelectedDate
        }
        
        return nil
    }
    
    var body: some View {
        Chart(Data){ puff in
            BarMark(
                x: .value("Day", puff.date,unit: .day),
                y: .value("Number of puff", puff.numberOfPuff),
                width: .ratio(0.6)
            )
            if let selectedDate {
                RuleMark(
                    x: .value("Selected", selectedDate, unit: .day)
                )
                .foregroundStyle(Color.red.opacity(0.3))
                
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 3600 * 24 * 7 )
        .foregroundColor(.orange)
        .chartXAxis {
            AxisMarks(values: .stride(by: .day, count: 1)) {
                AxisTick()
                AxisGridLine()
                AxisValueLabel(format: .dateTime.month().day())
            }
        }
        .chartScrollPosition(x: $scrollPositionStart)
        .chartXSelection(value: $rawSelectedDate)

//                                    .frame(height: 240)

    }
}

//#Preview {
//    puffWeekDetails()
//}
