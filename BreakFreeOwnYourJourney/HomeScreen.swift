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

func salesInPeriod(in range: ClosedRange<Date>) -> Int {
//        sampleData.filter { range.contains($0.day) }.reduce(0) { $0 + $1.sales }
    sampleData.filter { range.contains($0.date) }.reduce(0) { $0 + $1.numberOfPuff}
}

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
        
    
    var body: some View {
        NavigationStack{
            ZStack{
                TabView{
                    Resources()
                        .tabItem { 
                            Text("Resources")
                            Image(systemName: "book.fill")
                        }
                    ZStack{
                        Image(backgroundImage)
                            .resizable()
                            .opacity(0.7)
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black)
                            .opacity(0.2)
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
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                    .toolbarBackground(.visible, for: .navigationBar)
                    
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
