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
                            VStack{
                                Text("Number Of Puff \(puffData.numberOfPuff) on \(puffData.date.formatted(date: .abbreviated, time: .omitted))")
                                Text("Nicotine Concentration \(puffData.nicotineStrength, specifier: "%.1f")")
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
                    HStack{
                        TextField("Number of puff", text: $numberOfPuff)
                            .keyboardType(.numberPad)
                            .focused($isKeyboardShowing)
                            .onReceive(Just(numberOfPuff)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.numberOfPuff = filtered
                                }
                            }
                            .padding()
                        Button{
                                    addItem()
                        }label:{
                            Image(systemName: "plus")
                        }
                        .padding()
                        .font(.title3)
                    }
                    .font(.callout)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
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
