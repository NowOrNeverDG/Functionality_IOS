//
//  TemperatureCalculatorView.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/3/23.
//

import SwiftUI

struct TempConverterView: View {
    @State private var originalAmount: Double = 0.0
    @State private var originalType = "Celsius"
    @State private var selectedType = "Celsius"
    @FocusState private var amountIsFocused: Bool
    private let tempType = ["Celsius","Fahrenheit","Kelvin"]

    var transformAmount: Double {
        if originalType == "Celsius" {
            switch selectedType {
            case "Celsius": return originalAmount
            case "Fahrenheit": return TempertureConvertor.celsiusToFahrenheit(originalAmount)
            case "Kelvin": return TempertureConvertor.celsiusToKelvin(originalAmount)
            default: return -273.15
            }
        } else if originalType == "Fahrenheit" {
            switch selectedType {
            case "Celsius": return TempertureConvertor.FahrenheitToCelsius(originalAmount)
            case "Fahrenheit": return originalAmount
            case "Kelvin": return TempertureConvertor.FahrenheitToKelvin(originalAmount)
            default: return -273.15
            }
        } else {
            switch selectedType {
            case "Celsius": return TempertureConvertor.kelvinToCelsius(originalAmount)
            case "Fahrenheit": return TempertureConvertor.kelvinToFahrenheit(originalAmount)
            case "Kelvin": return originalAmount
            default: return -273.15
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
                    
                    Picker("Original Temperture Type", selection: $originalType) {
                        ForEach(tempType, id: \.self) { type in
                            Text(type)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("What's Temperture originally")
                }

                
                Section {
                    Text(transformAmount, format: .number)
                    
                    Picker("Converted Temperture Type", selection: $selectedType) {
                        ForEach(tempType, id: \.self) { type in
                            Text(type)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Temperture you want")
                }
            }
            .navigationTitle("Temperture Tansformation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct TempConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TempConverterView()
    }
}
