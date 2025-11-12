//
//  GoalsAndChallenges.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import SwiftData

struct GoalsAndChallenges: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @Query var puffTrackingData: [PuffTrackingData]
    @StateObject var goalsViewModel = GoalsViewModel()
    @State private var celebrate = false
    @State private var selectedFilter = 0

    var body: some View {
        NavigationView {
            ZStack {
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                    .ignoresSafeArea()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Picker("Filter", selection: $selectedFilter) {
                        Text("In Progress").tag(0)
                        Text("Completed").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    ForEach(goalsViewModel.goals.filter { selectedFilter == 0 ? !$0.isCompleted : $0.isCompleted }, id: \.id) { goal in
                        NavigationLink(destination: GoalDetailView(goal: goal)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(goal.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                    if goal.isCompleted {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                Text(goal.description)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                                    .padding(.bottom, 5)
                                ProgressView(value: goal.progress)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            }
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .onAppear {
                    goalsViewModel.updateProgress(puffData: puffTrackingData)
                    if goalsViewModel.goals.contains(where: { $0.isCompleted }) {
                        celebrate = true
                    }
                }
                
                if celebrate {
                    Text("🎉 Goal Achieved! 🎉")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(15)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                celebrate = false
                            }
                        }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    GoalsAndChallenges()
}
