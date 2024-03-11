//
//  HomeScreen.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI
import SwiftData
import Charts

enum timeRange{
    case week,month,year
}

struct TimeRangePicker: View {
    @Binding var value: timeRange

    var body: some View {
        Picker(selection: $value.animation(.easeInOut), label: EmptyView()) {
            Text("Week").tag(timeRange.week)
            Text("Month").tag(timeRange.month)
            Text("Year").tag(timeRange.year)
        }
        .pickerStyle(.segmented)
    }
}

var sampleData: [PuffTrackingData] = [
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 30)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 29)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 28)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 27)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 26)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 25)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 24)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 23)), numberOfPuff: 10, nicotineStrength: 15.6, puffDurationInMinutes: 5, additionalNotes: ""),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 22)), numberOfPuff: 12, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: "Feeling stressed at work"),
  PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 21)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 20)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 19)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 18)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 17)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 16)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 15)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
    PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 14)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
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
  PuffTrackingData(date: Date(), numberOfPuff: 19, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes")
]

struct HomeScreen: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @AppStorage("Name") var name: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    @Query var puffTracking: [PuffTrackingData]
    
    @State private var todayPuffIntake = 0.0
    @AppStorage("DailyPuffIntake") var DailyPuffIntake: Int = 0

        
    var totalPuffs: Int {
            sampleData.reduce(0) { $0 + $1.numberOfPuff }
        }
    
    func salesInPeriod(in range: ClosedRange<Date>) -> Int {
//        sampleData.filter { range.contains($0.day) }.reduce(0) { $0 + $1.sales }
        sampleData.filter { range.contains($0.date) }.reduce(0) { $0 + $1.numberOfPuff}
    }
    
    func calculateNicotineFrequency(data: [PuffTrackingData]) -> [String: Int] {
            var frequencyDict: [String: Int] = [:]
            
            for puffData in data {
                if  puffData.date < Date.now {
                    let nicotineConcentration = puffData.nicotineStrength
                    
                    if let frequency = frequencyDict["\(nicotineConcentration)"] {
                        frequencyDict["\(nicotineConcentration)"] = frequency + 1
                    } else {
                        frequencyDict["\(nicotineConcentration)"] = 1
                    }
                    
                }
                
            }
            
        return frequencyDict
        }
    
    @State private var freqDebt: [String: Int]  = [ : ]
    
    @State private var maxfrequency: Optional<Dictionary<String, Int>.Element>?
    
    @State private var keyFreq = ""
    @State private var valueFreq = -1
    
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
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                ScrollView {
                    VStack(alignment: .leading){
                        Rectangle()
                            .frame(height: 50)
                            .foregroundColor(.clear)
                        Text(name)
                            .font(.largeTitle.bold())
                            .padding([.leading])
                        
                        ProgressView("Today's Puff Intake", value: todayPuffIntake, total: Double(DailyPuffIntake))
                            .padding([.leading,.trailing])
                        ZStack{
                            Rectangle()
                                .frame(height: 400)
                                .foregroundColor(Color.blue)
                                .opacity(0.2)
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
                                    Text("Number of puff: \(salesInPeriod(in: scrollPositionStartM...scrollPositionEndM))")
                                        .font(.title2.bold())
                                        .foregroundColor(.primary)
                                    
                                    Text("\(scrollPositionStringM) – \(scrollPositionEndStringM)")
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                    Chart(sampleData) { puff in
                                        BarMark(
                                            x: .value("Day", puff.date,unit: .day),
                                            y: .value("Number of puff", puff.numberOfPuff),
                                            width: .ratio(0.6)
                                        )
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
                        ZStack{
                            Rectangle()
                                .frame(height: 340)
                                .foregroundColor(Color.blue)
                                .opacity(0.2)
                            VStack(alignment: .leading){
                                Text("Most Used Nicotine Concentration")
                                    .foregroundColor(.secondary)
                                
                                if let (key , values)  = maxfrequency ?? ("",-1){
                                    Text("\(key) mg/ml")
                                        .font(.title2.bold())
                                        .foregroundColor(.primary)
                                }
                                
                                Chart(Array(freqDebt), id: \.key){ puff in
                                    SectorMark(
                                        angle: .value("Concentration", puff.value),
                                        innerRadius: .ratio(0.618),
                                        angularInset: 1.5
                                    )
                                    .cornerRadius(5.0)
                                    .foregroundStyle(by: .value("Occurence", puff.key))
                                    .opacity( puff.key == keyFreq ? 1 : 0.3 )
                                }
                                .frame(height: 280)
                            }
                            .padding()

                        }
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
            .onAppear{
                freqDebt = calculateNicotineFrequency(data: sampleData)
                maxfrequency = freqDebt.max{ a, b in a.value < b.value  }
                (keyFreq, valueFreq) = (maxfrequency ?? ("", -1))!
                for i in sampleData{
                    if "\(i.date.formatted(.dateTime.year().month().day()) )" == "\(  Date.now.formatted(.dateTime.year().month().day()) )" {
                        todayPuffIntake += Double(i.numberOfPuff)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
