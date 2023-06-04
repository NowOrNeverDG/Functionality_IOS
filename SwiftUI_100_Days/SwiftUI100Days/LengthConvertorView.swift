//
//  LengthConvertor.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/3/23.
//

import SwiftUI

struct LengthConvertorView: View {
    @State private var originalAmount: Double = 0.0
    @State private var originalType = "Meters"
    @State private var selectedType = "Meters"
    @FocusState private var amountIsFocused
    private let lengthType = ["Meters","Feet","Yards"]
    
    private var convertedAmount: Double {
        if originalType == "Meters" {
            switch selectedType {
            case "Meters": return originalAmount
            case "Feet": return LengthConvertor.metersToFeet(originalAmount)
            case "Yards": return LengthConvertor.metersToYards(originalAmount)
            default: return 0
            }
        } else if originalType == "Feet" {
            switch selectedType {
            case "Meters": return LengthConvertor.feetToMeters(originalAmount)
            case "Feet": return originalAmount
            case "Yards": return LengthConvertor.feetToYards(originalAmount)
            default: return 0
            }
        } else {
            switch selectedType {
            case "Meters": return LengthConvertor.yardsToMeters(originalAmount)
            case "Feet": return LengthConvertor.yardsToFeet(originalAmount)
            case "Yards": return originalAmount
            default: return 0
            }
        }
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",value: $originalAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Original Length Type", selection: $originalType) {
                        ForEach(lengthType, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("What's length type right now")
                }
                
                Section {
                    Text(convertedAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Converted Length Type", selection: $selectedType) {
                        ForEach(lengthType, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Length type you want transfrom")
                }
            }
        }
    }
}



struct LengthConvertorView_Previews: PreviewProvider {
    static var previews: some View {
        LengthConvertorView()
    }
}
