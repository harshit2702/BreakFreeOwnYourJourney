//
//  AddData.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import SwiftData
import Combine


struct AddData: View {
    @AppStorage("background") var backgroundImage = "bg3"
    @Environment(\.modelContext) var modelContext
    
    @Query var puffTracking: [PuffTrackingData]
    
    @State private var numberOfPuff = ""
    
    @State private var path = [PuffTrackingData]()
    @FocusState private var isKeyboardShowing: Bool
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                    .ignoresSafeArea()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .opacity(0.2)
                    .ignoresSafeArea()
                List{
                    ForEach(puffTracking){puffData in
                        NavigationLink(value: puffData){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Puff: \(puffData.numberOfPuff)")
                                        .font(.headline)
                                    Text("Nicotine: \(puffData.nicotineStrength, specifier: "%.1f") mg")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("\(puffData.date.formatted(date: .abbreviated, time: .omitted))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                    }
                    .onDelete(perform: deleteItems)
                }
                .scrollContentBackground(.hidden)
                .navigationDestination(for: PuffTrackingData.self) { puffData in
                        editPuffView(puffData: puffData)
                    }
                
                VStack{
                    Spacer()
                    HStack {
                        TextField("Number of puffs", text: $numberOfPuff)
                            .keyboardType(.numberPad)
                            .focused($isKeyboardShowing)
                            .onReceive(Just(numberOfPuff)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.numberOfPuff = filtered
                                }
                            }
                        
                        Button(action: addItem) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .overlay(
                                Capsule()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    )
                }
                .padding([.leading,.trailing])
            }
        }
    }
    func addItem(){
        if numberOfPuff != ""{
            let puffData = PuffTrackingData(numberOfPuff: Int(numberOfPuff) ?? 0)
            modelContext.insert(puffData)
            numberOfPuff = ""
            isKeyboardShowing = false
        }
    }
    func deleteItems(offsets: IndexSet){
        for index in offsets{
            modelContext.delete(puffTracking[index])
        }
    }
}

#Preview {
    AddData()
}
