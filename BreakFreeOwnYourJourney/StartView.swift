//
//  StartView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI

struct StartView: View {
    @Binding var isStarted: Bool
    @AppStorage("Name") var name: String = ""
    @State private var scaleLogo: Double = 0.9
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 237/255, blue: 234/255),
                                                       Color(red: 156/255, green: 202/255, blue: 191/255),
                                                       Color(red: 143/255, green: 194/255, blue: 167/255),
                                                       Color(red: 112/255, green: 183/255, blue: 164/255),
                                                       Color(red: 71/255, green: 159/255, blue: 154/255),
                                                       Color(red: 46/255, green: 124/255, blue: 137/255),
                                                       Color(red: 35/255, green: 96/255, blue: 96/255),
                                                       Color(red: 11/255, green: 65/255, blue: 91/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scaleLogo)
                    .animation(.spring(duration: 2, bounce: 0.9), value: scaleLogo)
                
                Text("Break Free, Own Your Journey")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Reduce Nicotine Consumption. Your Way.")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                if name.isEmpty {
                    Button(action: {
                        isStarted = true
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                }
            }
        }
        .onAppear {
            scaleLogo = 1.1
            if !name.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isStarted = true
                }
            }
        }
    }
}

#Preview {
    StartView(isStarted: .constant(false))
}
