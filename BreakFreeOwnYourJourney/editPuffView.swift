//
//  editPuffView.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 02/04/24.
//

import SwiftUI
import Combine

struct editPuffView: View {
    @Bindable var puffData: PuffTrackingData
    @State private var numberOfPuff = ""
    @FocusState private var isKeyboardShowing: Bool

    var body: some View {
        Form{
            Section{
                TextField("Number of puff", text: $numberOfPuff)
                    .keyboardType(.numberPad)
                    .onReceive(Just(numberOfPuff)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.numberOfPuff = filtered
                        }
                    }
                Button("Verify \(puffData.numberOfPuff)"){
                    puffData.numberOfPuff = Int(numberOfPuff) ?? 0
                }
                
            }
            Section{
                Stepper("Puff Duration is \n  \(puffData.puffDurationInMinutes, specifier: "%.1f") Minutes", value: $puffData.puffDurationInMinutes, in: 0...100)
            }
            Section(header: Text("Nicotine Strength")) {
                TextField("Nicotine Strength (0-100)", value: $puffData.nicotineStrength, formatter: numberFormatter)
                    .keyboardType(.decimalPad)
                    .focused($isKeyboardShowing)
            }
            Section{
                DatePicker("Puff Date", selection: $puffData.date, displayedComponents: .date)
            }
            Section{
                TextField("Additional Notes", text: $puffData.additionalNotes , axis: .vertical)
            }
        }
        .onAppear{
            numberOfPuff = "\(puffData.numberOfPuff)"
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isKeyboardShowing = false
                }
            }
        }
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimum = 0
        formatter.maximum = 100
        return formatter
    }
}

//#Preview {
//    editPersonView()
//}
