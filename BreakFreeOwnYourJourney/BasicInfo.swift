//
//  BasicInfo.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 06/03/24.
//

import SwiftUI

struct BasicInfo: View {
    @AppStorage("Name") var name: String = ""
    @AppStorage("DOB") var DOB: String = ""
    @State private var selectedDate = Date()
    
    var age: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let birthDate = dateFormatter.date(from: DOB) ?? Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(red: 222/255, green: 240/255, blue: 255/255),
                                                           Color(red: 156/255, green: 202/255, blue: 191/255),
//                                                           Color(red: 143/255, green: 194/255, blue: 167/255),
//                                                           Color(red: 112/255, green: 183/255, blue: 164/255),
//                                                           Color(red: 71/255, green: 159/255, blue: 154/255),
//                                                           Color(red: 46/255, green: 124/255, blue: 137/255),
//                                                           Color(red: 35/255, green: 96/255, blue: 96/255),
                                                           Color(red: 172/255, green: 203/255, blue: 236/255),
//                                                           Color(red: 11/255, green: 65/255, blue: 91/255)
                                                          ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Enter Your Name")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    TextField("Name", text: $name)
                        .foregroundColor(Color(red: 11/255, green: 65/255, blue: 91/255))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.largeTitle)
                    
                    Divider()
                    
                    Text("Enter Your Date of Birth")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .medium
                            self.DOB = dateFormatter.string(from: selectedDate)
                        }) {
                            Text("Save")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 10)
                        .padding()
                        .background(Color(red: 11/255, green: 207/255, blue: 235/255))
                        .cornerRadius(20)
                        Spacer()

                    }
                    
                    
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .medium
                            self.selectedDate = dateFormatter.date(from: DOB) ?? Date()
                        }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    BasicInfo()
}