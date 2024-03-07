//
//  HomeScreen.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI
import SwiftData
import Charts

var sampleData: [PuffTrackingData] = [
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
  PuffTrackingData(date: Date(), numberOfPuff: 19, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
  PuffTrackingData(date: Date().addingTimeInterval((60 * 60 * 24 * 1)), numberOfPuff: 0, nicotineStrength: 0, puffDurationInMinutes: 0, additionalNotes: "")
]

struct HomeScreen: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @AppStorage("Name") var name: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    @Query var puffTracking: [PuffTrackingData]
        
    var totalPuffs: Int {
            sampleData.reduce(0) { $0 + $1.numberOfPuff }
        }
    
    func salesInPeriod(in range: ClosedRange<Date>) -> Int {
//        sampleData.filter { range.contains($0.day) }.reduce(0) { $0 + $1.sales }
        sampleData.filter { range.contains($0.date) }.reduce(0) { $0 + $1.numberOfPuff}
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
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                VStack(alignment: .leading){
                    Text(name)
                        .font(.largeTitle.bold())
                        .padding([.leading])
                    ZStack{
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(Color.blue)
                            .opacity(0.2)
                        VStack(alignment: .leading){
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
                            .frame(height: 240)
                        }
                        .padding()

                    }
                    ZStack{
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(Color.blue)
                            .opacity(0.2)
                        VStack(alignment: .leading){
                            Text("Most Used Nicotine Concentration")
                                .foregroundColor(.secondary)
                            
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
                            .frame(height: 240)
                        }
                        .padding()

                    }
                }
            }
            .ignoresSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            backgroundImage = "bg1"
                        }) {
                            Image("bg1")
                            Text("Background 1")
                        }
                        Button(action: {
                            backgroundImage = "bg2"
                        }) {
                            Image("bg2")
                            Text("Background 2")                        }
                        Button(action: {
                            backgroundImage = "bg3"
                        }) {
                            Image("bg3")
                            Text("Background 3")                        }
                        Button(action: {
                            backgroundImage = "bg4"
                        }) {
                            Image("bg4")
                            Text("Background 4")                        }
                        Button(action: {
                            backgroundImage = "bg5"
                        }) {
                            Image("bg5")
                            Text("Background 5")                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
