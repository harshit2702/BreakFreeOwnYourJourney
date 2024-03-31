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
    @Environment(\.calendar) var calendar
    @Environment(\.colorScheme) var colorScheme
    
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
    @State var rawSelectedMonth: Date? = nil

    
    var body: some View {
        VStack(alignment: .leading){
            TimeRangePicker(value: $timeRange)
                .padding(.bottom)
            switch timeRange {
            case .week:
                ZStack{
                    if rawSelectedDate == nil {
                        VStack(alignment: .leading){
                            Text("Number of puff: \(salesInPeriod(in: scrollPositionStart...scrollPositionEnd))")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            
                            Text("\(scrollPositionString) – \(scrollPositionEndString)")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    else{
                        if let selectedDate = rawSelectedDate,
                           let puffPerDay = puffPerDay(on: selectedDate){
                            VStack(alignment: .leading) {
                                Text("Puff on \(selectedDate, format: .dateTime.weekday(.abbreviated).day())")
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                                Text("\(puffPerDay, format: .number)")
                                    .font(.title2.bold())
                                    .blendMode(colorScheme == .light ? .plusDarker : .normal)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundStyle(Color.gray.opacity(0.12))
                            }
                            

                        }
                    }
                }
                
                puffWeekDetails(rawSelectedDate: $rawSelectedDate, scrollPositionStart: $scrollPositionStart, Data: sampleData)
                
            case .month:
                ZStack{
                    VStack(alignment: .leading){
                        Text("Number of puff: \(salesInPeriod(in: scrollPositionStartM...scrollPositionEndM))")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Text("\(scrollPositionStringM) – \(scrollPositionEndStringM)")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .opacity(rawSelectedDate == nil ? 1.0 : 0.0)
                    
                    
                }
                
                puffMonthDetails(rawSelectedDate: $rawSelectedDate, scrollPositionStartM: $scrollPositionStartM, Data: sampleData )
                



            case .year:
                ZStack{
                    if rawSelectedMonth == nil {
                        VStack(alignment: .leading){
                            Text("Number of puff: \(salesInPeriod(in: scrollPositionStartY...scrollPositionEndY))")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            
                            Text("\(scrollPositionStringY) – \(scrollPositionEndStringY)")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    else{
                        if let selectedMonth = rawSelectedMonth,
                           let avgPuffPerMonths = avgPuffPerMonths(on: selectedMonth as Date){
                            VStack(alignment: .leading) {
                                Text("Average Puff on  \(selectedMonth, format: .dateTime.month())")
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                                Text("\(avgPuffPerMonths, format: .number)")
                                    .font(.title2.bold())
                                    .blendMode(colorScheme == .light ? .plusDarker : .normal)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundStyle(Color.gray.opacity(0.12))
                            }
                            

                        }
                    }
                }
                puffYearDetails(rawSelectedMonth: $rawSelectedMonth, scrollPositionStartY: $scrollPositionStartY, Data: sampleData)
            }
            
            
        }
        .padding()
        .onChange(of: rawSelectedMonth) { oldValue, newValue in
            print(newValue)
        }
    }
    
    func puffPerDay(on selectedDate: Date) -> Int? {
            let startOfDay = Calendar.current.startOfDay(for: selectedDate)
            let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
            
            return sampleData.filter({ $0.date >= startOfDay && $0.date < endOfDay }).reduce(0, { $0 + $1.numberOfPuff })
        }
    
    //func avgPuffPerMonths
    func avgPuffPerMonths(on selectedDate: Date) -> Int? {
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
        let endOfMonth = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        
        let filteredData = sampleData.filter { $0.date >= startOfMonth && $0.date <= endOfMonth }
        let totalPuff = filteredData.reduce(0) { $0 + $1.numberOfPuff }
        print("totalPuff: \(totalPuff)")
        let numberOfMonths = Calendar.current.dateComponents([.day], from: startOfMonth, to: endOfMonth).day ?? 0
        print("numberOfMonths: \(numberOfMonths)")
        if numberOfMonths > 0 {
            print("not nil")
            return totalPuff / numberOfMonths
        } else {
            print("nil")
            
            return nil
        }
    }
}

#Preview {
    puffDetails()
}
