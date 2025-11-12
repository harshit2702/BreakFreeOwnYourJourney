//
//  PuffDetailsChartView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 12/11/25.
//

import SwiftUI
import Charts

struct PuffDetailsChartView: View {
    var puffTracking: [PuffTrackingData]
    var timeRange: timeRange
    
    @State private var rawSelectedDate: Date?
    @Binding var scrollPosition: Date
    
    @Environment(\.calendar) var calendar
    
    var body: some View {
        Chart(puffTracking) { puff in
            BarMark(
                x: .value("Date", puff.date, unit: chartXUnit),
                y: .value("Puffs", puff.numberOfPuff)
            )
            .foregroundStyle(by: .value("Date", puff.date))
        }
        .chartXVisibleDomain(length: chartVisibleDomainLength)
        .chartScrollableAxes(.horizontal)
        .chartXAxis {
            AxisMarks(values: .stride(by: chartXStride, count: 1)) {
                AxisTick()
                AxisGridLine()
                AxisValueLabel(format: chartXAxisLabelFormat, centered: true)
            }
        }
        .chartXSelection(value: $rawSelectedDate)
        .chartScrollPosition(x: $scrollPosition)
    }
    
    private var chartXUnit: Calendar.Component {
        switch timeRange {
        case .week, .month:
            return .day
        case .year:
            return .month
        }
    }
    
    private var chartVisibleDomainLength: TimeInterval {
        switch timeRange {
        case .week:
            return 3600 * 24 * 7
        case .month:
            return 3600 * 24 * 30
        case .year:
            return 3600 * 24 * 365
        }
    }
    
    private var chartXStride: Calendar.Component {
        switch timeRange {
        case .week:
            return .day
        case .month:
            return .day
        case .year:
            return .month
        }
    }
    
    private var chartXAxisLabelFormat: Date.FormatStyle {
        switch timeRange {
        case .week:
            return .dateTime.month().day()
        case .month:
            return .dateTime.day()
        case .year:
            return .dateTime.month()
        }
    }
}
