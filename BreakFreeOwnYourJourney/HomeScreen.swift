//
//  HomeScreen.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg3")
                    .resizable()
//                    .scaledToFill()
                VStack{
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    HomeScreen()
}
