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
    @State private var nicotineStrength = 0.0

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
                
                Stepper("Puff Duration is \n  \(puffData.puffDurationInMinutes, specifier: "%.1f") Minutes", value: $puffData.puffDurationInMinutes, in: 0...100)
            }
            Section{
                HStack{
                    Text("Nicotine Strength \(puffData.nicotineStrength + nicotineStrength , specifier: "%.1f")")
                    Spacer()
                    Stepper("Nicotine Strength ", value: $puffData.nicotineStrength, in: 0...100)
                        .labelsHidden()
                    Text(".")
                        .font(.title.bold())
                    Stepper("Nicotine Strength ", value: $nicotineStrength, in: 0...1 ,step: 0.1)
                        .labelsHidden()
                }
                
            }
            Section{
                DatePicker("Puff Date", selection: $puffData.date, displayedComponents: .date)
            }
            Section{
                TextField("Additional Notes", text: $puffData.additionalNotes , axis: .vertical)
            }
            Button("Save"){
                puffData.numberOfPuff = Int(numberOfPuff) ?? 0
                puffData.nicotineStrength = puffData.nicotineStrength + nicotineStrength
               
            }
        }
        .onAppear{
            numberOfPuff = "\(puffData.numberOfPuff)"
            //split the decimal value of nicotine in two variable
            nicotineStrength = puffData.nicotineStrength.truncatingRemainder(dividingBy: 1)
        }
    }
}

//#Preview {
//    editPersonView()
//}
