//
//  puffYearDetails.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import Charts

struct puffYearDetails: View {
    
    @Binding var rawSelectedMonth: Date?
    @Environment(\.calendar) var calendar
    @Environment(\.colorScheme) var colorScheme
    @Binding var scrollPositionStartY: Date
    
    var Data: [PuffTrackingData]
    
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
        .chartXSelection(value: $rawSelectedMonth)


    }
}

//#Preview {
//    puffYearDetails()
//}
