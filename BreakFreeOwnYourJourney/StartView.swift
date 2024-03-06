//
//  StartView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI

struct StartView: View {
    @Binding var isStarted: Bool
    var body: some View {
        NavigationStack{
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
                GeometryReader{ geo in
                    
                    VStack {
                        
                        Image("logo")
                            .resizable()
                            .offset(x: (geo.size.width / 2) - 200, y: (geo.size.height / 2) - 300 )
                            .frame(width: 400,height: 400)
                        
                        
                        Text("Break Free,")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text("Own Your Journey")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Reduce Nicotine Consumption. Your Way.")
                            .font(.callout)
                            .foregroundColor(Color(white: 0.9))
                            .offset(y:  geo.size.height * 0.05)
                        
                        
                        Button("Get Started") {
                            isStarted = true
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 10)
                        .padding()
                        .background(Color(red: 11/255, green: 207/255, blue: 235/255))
                        .cornerRadius(20)
                        .offset(y: geo.size.height * 0.3)
                        
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    StartView(isStarted: .constant(false))
}
