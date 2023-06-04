//
//  LengthConvertor.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/3/23.
//

import Foundation

struct LengthConvertor {
    private let lengthType = ["Meters","Feet","Yards"]
    
    static func metersToFeet(_ meters: Double) -> Double { return meters * 3.28084 }
    static func metersToYards(_ meters: Double) -> Double { return meters / 0.9144 }
    
    static func feetToMeters(_ feet: Double) -> Double { return feet / 3.28084 }
    static func feetToYards(_ feet: Double) -> Double { return feet / 3 }
    
    static func yardsToMeters(_ yards: Double) -> Double { return yards * 0.9144 }
    static func yardsToFeet(_ yards: Double) -> Double { return yards * 3 }
}
