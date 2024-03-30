//
//  puffMonthDetails.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 29/03/24.
//

import SwiftUI
import Charts

struct puffMonthDetails: View {
    
    @Binding var rawSelectedDate: Date?
    @Environment(\.calendar) var calendar
    @Environment(\.colorScheme) var colorScheme
    @Binding var scrollPositionStartM: Date
    
    var Data: [PuffTrackingData]
    
    func endOfDay(for date: Date) -> Date {
        calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    var selectedDate: Date? {
        if let rawSelectedDate {
            return Data.first(where: {
                let endOfDay = endOfDay(for: $0.date)
                
                return ($0.date ... endOfDay).contains(rawSelectedDate)
            })?.date
        }
        
        return nil
    }

    
    var body: some View {
        Chart(Data) { puff in
            BarMark(
                x: .value("Day", puff.date,unit: .day),
                y: .value("Number of puff", puff.numberOfPuff),
                width: .ratio(0.6)
            )
            if let selectedDate {
                RuleMark(
                    x: .value("Selected", selectedDate, unit: .day)
                )
                .foregroundStyle(Color.gray.opacity(0.3))
                .offset(yStart: -10)
                .zIndex(-1)
                .annotation(
                    position: .automatic, spacing: 0,
                    overflowResolution: .init(
                        x: .fit(to: .chart),
                        y: .fill
                    )
                ) {
                    valueSelectionPopover
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 3600 * 24 * 30 )
        .chartXAxis {
            AxisMarks(values: .stride(by: .day, count: 7)) {
                AxisTick()
                AxisGridLine()
                AxisValueLabel(format: .dateTime.day())
            }
        }
        .chartScrollPosition(x: $scrollPositionStartM)
        .chartXSelection(value: $rawSelectedDate)
        
    }
    
    @ViewBuilder
    var valueSelectionPopover: some View {
        if let selectedDate,
           let puffPerDay = puffPerDay(on: selectedDate) {
            VStack(alignment: .leading) {
                Text("Puff on \(selectedDate, format: .dateTime.weekday(.wide))s")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                HStack(spacing: 20) {
                    Text("\(puffPerDay, format: .number)")
                        .font(.title2.bold())
                        .blendMode(colorScheme == .light ? .plusDarker : .normal)
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.red.opacity(0.12))
            }
        } else {
            EmptyView()
        }
    }
    
    func puffPerDay(on selectedDate: Date) -> Int? {
            let startOfDay = Calendar.current.startOfDay(for: selectedDate)
            let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
            
            return Data.filter({ $0.date >= startOfDay && $0.date < endOfDay }).reduce(0, { $0 + $1.numberOfPuff })
        }
    
}
//#Preview {
//    puffMonthDetails(scrollPositionStartM: <#Binding<Date>#>, Data: <#Binding<[PuffTrackingData]>#>)
//}
