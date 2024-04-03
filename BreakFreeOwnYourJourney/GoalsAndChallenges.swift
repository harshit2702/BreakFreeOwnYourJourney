//
//  GoalsAndChallenges.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI

struct GoalsAndChallenges: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 237/255, blue: 234/255),
                                                       Color(red: 156/255, green: 202/255, blue: 191/255),
                                                       Color(red: 143/255, green: 194/255, blue: 167/255),
                                                       Color(red: 112/255, green: 183/255, blue: 164/255),
                                                       Color(red: 71/255, green: 159/255, blue: 154/255),
                                                       Color(red: 46/255, green: 124/255, blue: 137/255),
                                                       Color(red: 35/255, green: 96/255, blue: 96/255),
                                                       //                                                           Color(red: 14/255, green: 69/255, blue: 96/255),
                                                       Color(red: 11/255, green: 65/255, blue: 91/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.9)
            VStack{
                Text("Coming Soon")
                    .font(.largeTitle.bold())
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    GoalsAndChallenges()
}
