//
//  TempConvertor.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/3/23.
//

import Foundation

struct TempertureConvertor {
    static func celsiusToFahrenheit(_ celsius: Double) -> Double {
        return (celsius * 9/5) + 32
    }
    
    static func celsiusToKelvin(_ celsius: Double) -> Double {
        return celsius + 273.15
    }
    
    static func FahrenheitToCelsius(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5/9
    }
    
    static func FahrenheitToKelvin(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5/9 + 273.15
    }
    
    static func kelvinToCelsius(_ kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    
    static func kelvinToFahrenheit(_ kelvin:Double) -> Double {
        return (kelvin - 273.15) * 9/5 + 32
    }
}
