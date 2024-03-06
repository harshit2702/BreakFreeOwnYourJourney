//
//  HomeScreen.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI
import SwiftData
import Charts

struct HomeScreen: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @AppStorage("Name") var name: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    @Query var puffTracking: [PuffTrackingData]
    
    var sampleData: [PuffTrackingData] = [
      PuffTrackingData(date: Date(), numberOfPuff: 10, nicotineStrength: 15.6, puffDurationInMinutes: 5, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24)), numberOfPuff: 12, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: "Feeling stressed at work"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 2)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 3)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 4)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 5)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 6)), numberOfPuff: 5, nicotineStrength: 12.0, puffDurationInMinutes: 3, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 7)), numberOfPuff: 9, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: "Feeling anxious"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 8)), numberOfPuff: 6, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 9)), numberOfPuff: 13, nicotineStrength: 18.0, puffDurationInMinutes: 8, additionalNotes: "Social gathering with vapers"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 10)), numberOfPuff: 8, nicotineStrength: 15.6, puffDurationInMinutes: 4, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 11)), numberOfPuff: 15, nicotineStrength: 18.0, puffDurationInMinutes: 7, additionalNotes: "Craving after dinner"),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 12)), numberOfPuff: 7, nicotineStrength: 12.0, puffDurationInMinutes: 2, additionalNotes: ""),
      PuffTrackingData(date: Date().addingTimeInterval(-(60 * 60 * 24 * 13)), numberOfPuff: 11, nicotineStrength: 15.6, puffDurationInMinutes: 6, additionalNotes: "With friend who vapes")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(Color.black)
                            .opacity(0.4)
                        VStack(alignment: .leading){
                            Text("Number of puff")
                            Chart(sampleData){ puff in
                                BarMark(
                                    x: .value("Day", puff.date,unit: .day),
                                    y: .value("Number of puff", puff.numberOfPuff)
                                )
                            }
                            .chartScrollableAxes(.horizontal)
                            .chartXVisibleDomain(length: 3600 * 24 * 7 )
                            .chartXAxis {
                                AxisMarks(values: .stride(by: .day, count: 1)) {
                                    AxisTick()
                                    AxisGridLine()
                                    AxisValueLabel(format: .dateTime.weekday())
                                }
                            }
                            .frame(height: 240)
                        }
                        .padding()

                    }
                }
                .navigationTitle(name)
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
