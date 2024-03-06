//
//  ContentView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isStarted = false
    var body: some View {
        if !isStarted {
            StartView(isStarted: $isStarted)
        }
        else{
            BasicInfo()
        }
    }
}

#Preview {
    ContentView()
}

