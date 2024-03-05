//
//  ContentView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 237/255, blue: 234/255),
                                                       Color(red: 156/255, green: 202/255, blue: 191/255),
                                                       Color(red: 143/255, green: 194/255, blue: 167/255),
                                                       Color(red: 112/255, green: 183/255, blue: 164/255),
                                                       Color(red: 71/255, green: 159/255, blue: 154/255),
                                                       Color(red: 46/255, green: 124/255, blue: 137/255),
                                                       Color(red: 35/255, green: 96/255, blue: 96/255),
                                                       Color(red: 14/255, green: 69/255, blue: 96/255),
                                                       Color(red: 11/255, green: 65/255, blue: 91/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 400,height: 400)
                Text("Break Free Own Your Journey")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                
            }
            
        }
        .ignoresSafeArea(.all)
        
    }
    
}

#Preview {
    ContentView()
}

