
import SwiftUI

struct GoalDetailView: View {
    let goal: Goal

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
                .opacity(0.9)
                .ignoresSafeArea()

            VStack {
                Text(goal.title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding()

                Text(goal.description)
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                    .padding()

                Spacer()

                if goal.isCompleted {
                    VStack {
                        Text("🎉")
                            .font(.system(size: 100))
                        Text("Goal Achieved!")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                    }
                } else {
                    Gauge(value: goal.progress, in: 0...1) {
                        Text("Progress")
                    } currentValueLabel: {
                        Text("\(Int(goal.progress * 100))%")
                            .foregroundColor(.white)
                    }
                    .gaugeStyle(SpeedometerGaugeStyle())
                    .padding()
                }

                Spacer()
            }
        }
//        .navigationTitle("Goal Details")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpeedometerGaugeStyle: GaugeStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.white)

            Circle()
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(.degrees(-90))

            configuration.currentValueLabel
                .font(.largeTitle)
        }
    }
}

