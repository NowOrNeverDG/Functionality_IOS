//
//  ViewModel.swift
//  [SwiftUI]Dragable
//
//  Created by Ge Ding on 11/19/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var mainTasks: [String] = ["Go Work", "Go Sleep", "Meditation"]
    @Published var monTasks: [String] = []
    @Published var tueTasks: [String] = []
    @Published var wedTasks: [String] = []
    @Published var thuTasks: [String] = []
    @Published var friTasks: [String] = []
    @Published var satTasks: [String] = []
    @Published var sunTasks: [String] = []

}
