# BreakFree: Own Your Journey

BreakFree is a SwiftUI app designed to help users quit vaping. It provides tools for tracking puff count, nicotine strength, and puff duration, along with a goals and challenges system to keep users motivated.

## Features

*   **Puff Tracking**: Log your daily puff count, nicotine strength, and puff duration.
*   **Data Visualization**: View your progress over time with interactive charts.
*   **Goals and Challenges**: Set and track goals to help you quit, such as:
    *   Daily puff reduction targets
    *   Weekly streaks of reduced puffing
    *   Nicotine strength reduction goals
*   **Celebratory Animations**: Get positive reinforcement when you achieve your goals.

## Architecture

The app is built using SwiftUI and SwiftData for data persistence.

### Key Components

*   **`PuffTrackingData.swift`**: The SwiftData model for storing puff tracking information.
*   **`Goals.swift`**: Defines the data structures for goals and the `GoalsViewModel` for managing goal-related logic.
*   **`GoalsAndChallenges.swift`**: The SwiftUI view that displays the user's goals and progress.
*   **`ContentView.swift`**: The main view of the app, which handles the initial setup and navigation.
*   **`HomeScreen.swift`**: The main dashboard of the app, providing access to all features.

## How to Contribute

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with descriptive messages.
4.  Push your changes to your fork.
5.  Create a pull request to the main repository.
