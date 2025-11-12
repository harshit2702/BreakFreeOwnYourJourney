
import Foundation
import SwiftUI

struct Goal {
    var id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
    var progress: Double // 0.0 to 1.0
}

class GoalsViewModel: ObservableObject {
    @Published var goals: [Goal] = []

    init() {
        goals.append(Goal(title: "Daily Puff Reduction", description: "Reduce your daily puff count by 10%", isCompleted: false, progress: 0.0))
        goals.append(Goal(title: "Weekly Streak", description: "Maintain your puff reduction for 7 days", isCompleted: false, progress: 0.0))
        goals.append(Goal(title: "Nicotine Strength Reduction", description: "Reduce your nicotine strength by 10%", isCompleted: false, progress: 0.0))
        goals.append(Goal(title: "Puff-Free Day", description: "Have a day with zero puffs", isCompleted: false, progress: 0.0))
        goals.append(Goal(title: "Reduce Puff Duration", description: "Reduce your average puff duration by 10%", isCompleted: false, progress: 0.0))
    }

    func updateProgress(puffData: [PuffTrackingData]) {
        updateDailyPuffReduction(puffData: puffData)
        updateWeeklyStreak(puffData: puffData)
        updateNicotineStrengthReduction(puffData: puffData)
        updatePuffFreeDay(puffData: puffData)
        updatePuffDurationReduction(puffData: puffData)
    }
    
    private func updatePuffDurationReduction(puffData: [PuffTrackingData]) {
        guard let goalIndex = goals.firstIndex(where: { $0.title == "Reduce Puff Duration" }) else { return }

        let thisWeek = Date()
        let lastWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: thisWeek)!

        let thisWeekAverage = averagePuffDuration(for: thisWeek, in: puffData)
        let lastWeekAverage = averagePuffDuration(for: lastWeek, in: puffData)

        if lastWeekAverage > 0 {
            let reduction = (lastWeekAverage - thisWeekAverage) / lastWeekAverage
            goals[goalIndex].progress = max(0, reduction)
        } else {
            goals[goalIndex].progress = thisWeekAverage == 0 ? 1.0 : 0.0
        }

        if goals[goalIndex].progress >= 0.1 {
            goals[goalIndex].isCompleted = true
        }
    }
    
    private func averagePuffDuration(for week: Date, in puffData: [PuffTrackingData]) -> Double {
        let weekData = puffData.filter { Calendar.current.isDate($0.date, equalTo: week, toGranularity: .weekOfYear) }
        if weekData.isEmpty {
            return 0.0
        }
        let totalDuration = weekData.reduce(0) { $0 + $1.puffDurationInMinutes }
        return totalDuration / Double(weekData.count)
    }

    private func updatePuffFreeDay(puffData: [PuffTrackingData]) {
        guard let goalIndex = goals.firstIndex(where: { $0.title == "Puff-Free Day" }) else { return }

        let today = Calendar.current.startOfDay(for: Date())
        let todaysPuffs = puffs(for: today, in: puffData)

        if todaysPuffs == 0 {
            goals[goalIndex].progress = 1.0
            goals[goalIndex].isCompleted = true
        } else {
            goals[goalIndex].progress = 0.0
            goals[goalIndex].isCompleted = false
        }
    }

    private func updateDailyPuffReduction(puffData: [PuffTrackingData]) {
        guard let goalIndex = goals.firstIndex(where: { $0.title == "Daily Puff Reduction" }) else { return }

        let today = Calendar.current.startOfDay(for: Date())
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!

        let todaysPuffs = puffs(for: today, in: puffData)
        let yesterdaysPuffs = puffs(for: yesterday, in: puffData)

        if yesterdaysPuffs > 0 {
            let reduction = Double(yesterdaysPuffs - todaysPuffs) / Double(yesterdaysPuffs)
            goals[goalIndex].progress = max(0, reduction)
        } else {
            goals[goalIndex].progress = todaysPuffs == 0 ? 1.0 : 0.0
        }

        if goals[goalIndex].progress >= 0.1 {
            goals[goalIndex].isCompleted = true
        }
    }

    private func updateWeeklyStreak(puffData: [PuffTrackingData]) {
        guard let goalIndex = goals.firstIndex(where: { $0.title == "Weekly Streak" }) else { return }

        var streak = 0
        for i in 0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: Date())!
            let previousDate = Calendar.current.date(byAdding: .day, value: -i-1, to: Date())!
            
            let todaysPuffs = puffs(for: date, in: puffData)
            let yesterdaysPuffs = puffs(for: previousDate, in: puffData)

            if todaysPuffs <= yesterdaysPuffs {
                streak += 1
            } else {
                break
            }
        }
        goals[goalIndex].progress = Double(streak) / 7.0
        if streak >= 7 {
            goals[goalIndex].isCompleted = true
        }
    }

    private func updateNicotineStrengthReduction(puffData: [PuffTrackingData]) {
        guard let goalIndex = goals.firstIndex(where: { $0.title == "Nicotine Strength Reduction" }) else { return }

        let thisWeek = Date()
        let lastWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: thisWeek)!

        let thisWeekAverage = averageNicotineStrength(for: thisWeek, in: puffData)
        let lastWeekAverage = averageNicotineStrength(for: lastWeek, in: puffData)

        if lastWeekAverage > 0 {
            let reduction = (lastWeekAverage - thisWeekAverage) / lastWeekAverage
            goals[goalIndex].progress = max(0, reduction)
        } else {
            goals[goalIndex].progress = thisWeekAverage == 0 ? 1.0 : 0.0
        }

        if goals[goalIndex].progress >= 0.1 {
            goals[goalIndex].isCompleted = true
        }
    }

    private func puffs(for date: Date, in puffData: [PuffTrackingData]) -> Int {
        puffData.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }.reduce(0) { $0 + $1.numberOfPuff }
    }

    private func averageNicotineStrength(for week: Date, in puffData: [PuffTrackingData]) -> Double {
        let weekData = puffData.filter { Calendar.current.isDate($0.date, equalTo: week, toGranularity: .weekOfYear) }
        if weekData.isEmpty {
            return 0.0
        }
        let totalNicotine = weekData.reduce(0) { $0 + $1.nicotineStrength }
        return totalNicotine / Double(weekData.count)
    }
}
