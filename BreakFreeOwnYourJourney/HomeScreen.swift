//
//  HomeScreen.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI
import SwiftData
import Charts

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

struct HomeScreen: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @AppStorage("Name") var name: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    @Query var puffTracking: [PuffTrackingData]
//    @State private var puffTracking = sampleDataMonthly
    
    
    @State private var todayPuffIntake = 0.0
    @AppStorage("DailyPuffIntake") var DailyPuffIntake: Int = 0
    @AppStorage("BasicInfo") var isBasicInfo = false


        
    var totalPuffs: Int {
        puffTracking.reduce(0) { $0 + $1.numberOfPuff }
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
    
    @State var sortedFreqDebt: [Dictionary<String, Int>.Element] = []
    
    @State private var maxfrequency: Optional<Dictionary<String, Int>.Element>?
    
    @State private var keyFreq = ""
    @State private var valueFreq = -1
    
    @State var selectedConcentration: Double? = nil
 
    
    @State var cumulativeSalesRangesForStyles: [(name: String, range: Range<Double>)]? = nil

    
    var selectedStyle: Optional<Dictionary<String, Int>.Element>? {
        if let selectedConcentration,
           let selectedIndex = cumulativeSalesRangesForStyles?
            .firstIndex(where: { $0.range.contains(selectedConcentration) }) {
            return sortedFreqDebt[selectedIndex]
        }
        
        return nil
    }

    
    var body: some View {
        NavigationStack{
            ZStack{
                TabView{
                    ZStack{
                        Image(backgroundImage)
                            .resizable()
                            .opacity(0.7)
                            .ignoresSafeArea()
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black)
                            .opacity(0.2)
                            .ignoresSafeArea()
                        ScrollView {
                            VStack{
                                Rectangle()
                                  .frame(height: 50)
                                  .foregroundColor(.clear)
                                VStack (alignment: .center){
                                    ZStack {
                                        Circle()
                                            .stroke(lineWidth: 30)
                                            .opacity(0.3)
                                        
                                        Circle()
                                            .trim(from: 0, to: CGFloat((todayPuffIntake + 3) / Double(DailyPuffIntake)))
                                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                            .foregroundColor(.pink)
                                            .rotationEffect(Angle(degrees: -90))
                                        
                                        VStack{
                                            Text("\(Int(todayPuffIntake))")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                            Text("of \(DailyPuffIntake) is Taken Today")
                                        }
                                    }
                                    .frame(width: 200, height: 200)
                                }
                                .padding(.bottom)
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height: 400)
                                        .foregroundColor(Color.blue)
                                        .opacity(0.2)
                                    puffDetails()
                                    
                                }
                                ZStack{
                                    Rectangle()
                                        .frame(height: 340)
                                        .foregroundColor(Color.blue)
                                        .opacity(0.2)
                                    VStack(alignment: .leading){
                                        Text("Nicotine Concentration")
                                            .font(.title2.bold())
                                            .foregroundColor(.primary)
                                        
                                        
                                        Chart(Array(sortedFreqDebt), id: \.key){ puff in
                                            SectorMark(
                                                angle: .value("Concentration", puff.value),
                                                innerRadius: .ratio(0.618),
                                                angularInset: 1.5
                                            )
                                            .cornerRadius(5.0)
                                            .foregroundStyle(by: .value("Occurence", puff.key))
                                            .opacity(puff.key == (selectedStyle??.key ?? keyFreq) ? 1 : 0.3)
                                        }
                                        .chartLegend(alignment: .center, spacing: 18)
                                        .chartAngleSelection(value: $selectedConcentration)
                                        .chartBackground { chartProxy in
                                            GeometryReader { geometry in
                                                let frame = geometry[chartProxy.plotFrame!]
                                                VStack {
                                                    Text("Most Used")
                                                        .font(.callout)
                                                        .foregroundStyle(.secondary)
                                                        .opacity(selectedStyle == nil || selectedStyle??.key == keyFreq ? 1 : 0)
                                                    Text(selectedStyle??.key ?? "\(keyFreq)")
                                                        .font(.title2.bold())
                                                        .foregroundColor(.primary)
                                                    Text("\(selectedStyle??.value ?? valueFreq) Used")
                                                        .font(.callout)
                                                        .foregroundStyle(.secondary)
                                                }
                                                .position(x: frame.midX, y: frame.midY)
                                            }
                                        }
                                    }
                                    .padding()
                                    
                                }
                                ZStack{
                                    Rectangle()
                                        .frame(height: 400)
                                        .foregroundColor(Color.blue)
                                        .opacity(0.2)
                                    VStack(alignment: .leading){
                                        Text("Puff Duration")
                                            .font(.title2.bold())
                                            .foregroundColor(.primary)
                                        monthlyPuffDuration(puffTracking: puffTracking)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                    .toolbarBackground(.visible, for: .navigationBar)
                    
                    
                    
                    Resources()
                        .tabItem {
                            Text("Resources")
                            Image(systemName: "book.fill")
                        }
                    
                    
                    GoalsAndChallenges()
                        .tabItem {
                            Text("Goals")
                            Image(systemName: "medal.fill")
                        }
                    AddData()
                        .tabItem {
                            Text("Add")
                            Image(systemName: "plus.app.fill")
                        }
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                    }label:{
                        Text(name)
                            .foregroundColor(.black)
                            .font(.largeTitle.bold())
                            .multilineTextAlignment(.leading)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Menu{
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
                        } label:{
                            Text("Background")
                        }
                        Button("Basic Info"){
                            isBasicInfo = false
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                    }
                }
            }
            .onAppear{
                freqDebt = calculateNicotineFrequency(data: puffTracking)
                sortedFreqDebt =  freqDebt.sorted(by: {$0.key < $1.key})
                maxfrequency = freqDebt.max{ a, b in a.value < b.value  }
                (keyFreq, valueFreq) = (maxfrequency ?? (" ", -1)) ?? (" ",-1)
                var cumulative = 0.0
                cumulativeSalesRangesForStyles = sortedFreqDebt.map {
                    let newCumulative = cumulative + Double($0.value)
                    let result = (name: $0.key, range: cumulative ..< newCumulative)
                    cumulative = newCumulative
                    return result
                }
                todayPuffIntake = 0
                for i in puffTracking{
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
