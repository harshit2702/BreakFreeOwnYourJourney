//
//  puffDetails.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 29/03/24.
//

import SwiftUI
import Charts
import SwiftData

struct puffDetails: View {
    
    @State private var timeRange: timeRange = .month
    
    @State var scrollPositionStartY: Date = sampleData.last!.date.addingTimeInterval( -1 * 3600 * 24 * 365)

    var scrollPositionEndY: Date {
        scrollPositionStartM.addingTimeInterval(3600 * 24 * 365)
    }
    
    var scrollPositionStringY: String {
        scrollPositionStartM.formatted(.dateTime.year().month())
    }
    
    var scrollPositionEndStringY: String {
        scrollPositionEndM.addingTimeInterval(-(3600 * 24 * 1)).formatted(.dateTime.month().year())
    }

    @State var scrollPositionStartM: Date = sampleData.last!.date.addingTimeInterval( -1 * 3600 * 24 * 30)

    var scrollPositionEndM: Date {
        scrollPositionStartM.addingTimeInterval(3600 * 24 * 30)
    }
    
    var scrollPositionStringM: String {
        scrollPositionStartM.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndStringM: String {
        scrollPositionEndM.addingTimeInterval(-(3600 * 24 * 1)).formatted(.dateTime.month().day().year())
    }
    
    @State var scrollPositionStart: Date = sampleData.last!.date.addingTimeInterval( -1 * 3600 * 24 * 7)
    
    var scrollPositionEnd: Date {
        scrollPositionStart.addingTimeInterval(3600 * 24 * 7)
    }
    
    var scrollPositionString: String {
        scrollPositionStart.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndString: String {
        scrollPositionEnd.addingTimeInterval(-(3600 * 24 * 1)).formatted(.dateTime.month().day().year())
    }
    
    @State var rawSelectedDate: Date? = nil

    
    var body: some View {
        VStack(alignment: .leading){
            TimeRangePicker(value: $timeRange)
                .padding(.bottom)
            switch timeRange {
            case .week:
                Text("Number of puff: \(salesInPeriod(in: scrollPositionStart...scrollPositionEnd))")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                
                Text("\(scrollPositionString) – \(scrollPositionEndString)")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                Chart(sampleData){ puff in
                    BarMark(
                        x: .value("Day", puff.date,unit: .day),
                        y: .value("Number of puff", puff.numberOfPuff),
                        width: .ratio(0.6)
                    )
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
//                                    .frame(height: 240)
            
            case .month:
                VStack(alignment: .leading){
                    Text("Number of puff: \(salesInPeriod(in: scrollPositionStartM...scrollPositionEndM))")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                    
                    Text("\(scrollPositionStringM) – \(scrollPositionEndStringM)")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .opacity(rawSelectedDate == nil ? 1.0 : 0.0)
                
                puffMonthDetails(scrollPositionStartM: $scrollPositionStartM, Data: sampleData )



            case .year:
                Text("Number of puff: \(salesInPeriod(in: scrollPositionStartY...scrollPositionEndY))")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                
                Text("\(scrollPositionStringY) – \(scrollPositionEndStringY)")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Chart(sampleData) { puff in
                    BarMark(
                        x: .value("Day", puff.date,unit: .month),
                        y: .value("Number of puff", puff.numberOfPuff),
                        width: .ratio(0.6)
                    )
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
            }
            
            
        }
        .padding()
    }
}

#Preview {
    puffDetails()
}
