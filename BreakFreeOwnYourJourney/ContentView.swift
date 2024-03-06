//
//  ContentView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isStarted = false
    @AppStorage("BasicInfo") var isBasicInfo = false

    var body: some View {
        if !isStarted {
            StartView(isStarted: $isStarted)
        }
        else{
            if !isBasicInfo{
                BasicInfo(isBasicInfo: $isBasicInfo)
            }
            else{
                HomeScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}

