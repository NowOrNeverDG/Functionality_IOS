//
//  Extension.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/7/23.
//

import Foundation
import SwiftUI

struct ZeroPercentageReminder:ViewModifier {
    var tipsPercentage:Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(tipsPercentage == 0 ? .red : .black)
    }
}

extension View {
    func zeroPercentageRemind(with tipsPercentage: Int) -> some View {
        modifier(ZeroPercentageReminder(tipsPercentage: tipsPercentage))
    }
}
