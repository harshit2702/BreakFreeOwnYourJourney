//
//  BreakFreeOwnYourJourneyApp.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 05/03/24.
//

import SwiftUI
import SwiftData

@main
struct BreakFreeOwnYourJourneyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            PuffTrackingData.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
