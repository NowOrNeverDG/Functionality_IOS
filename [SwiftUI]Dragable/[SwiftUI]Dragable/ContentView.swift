//
//  ContentView.swift
//  [SwiftUI]Dragable
//
//  Created by Ge Ding on 11/17/23.
//

import SwiftUI
import Algorithms
struct ContentView: View {
    @State private var mainTasks: [String] = ["Work", "Sleep","Meditation"]
    @State var monTasks: [String] = []
    @State var tueTasks: [String] = []
    @State var wedTasks: [String] = []
    @State var thuTasks: [String] = []
    @State var friTasks: [String] = []
    @State var satTasks: [String] = []
    @State var sunTasks: [String] = []
    
    @State private var isMainTargered = false
    @State private var isMonTargeted = false
    @State private var isTueTargeted = false
    @State private var isWedTargeted = false
    @State private var isThuTargeted = false
    @State private var isFriTargeted = false
    @State private var isSatTargeted = false
    @State private var isSunTargeted = false
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(spacing: 0) {
                KanbanView(title: "", isTargeted: isTueTargeted, tasks: $monTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            tueTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = monTasks + droppedTasks
                        monTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isMonTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isWedTargeted, tasks: $tueTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = tueTasks + droppedTasks
                        tueTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isTueTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isThuTargeted, tasks: $wedTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            tueTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = wedTasks + droppedTasks
                        wedTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isWedTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isFriTargeted, tasks: $thuTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            tueTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = thuTasks + droppedTasks
                        thuTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isThuTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isMonTargeted, tasks: $friTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            tueTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = friTasks + droppedTasks
                        friTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isFriTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isSatTargeted, tasks: $satTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            tueTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            sunTasks.removeAll { $0 == task}
                        }
                        let total = satTasks + droppedTasks
                        satTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isSatTargeted = isTargeted
                    }
                KanbanView(title: "", isTargeted: isSunTargeted, tasks: $sunTasks, mainTasks: $mainTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        for task in droppedTasks {
                            monTasks.removeAll { $0 == task}
                            tueTasks.removeAll { $0 == task}
                            wedTasks.removeAll { $0 == task}
                            thuTasks.removeAll { $0 == task}
                            friTasks.removeAll { $0 == task}
                            satTasks.removeAll { $0 == task}
                        }
                        let total = sunTasks + droppedTasks
                        sunTasks = Array(total.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isSunTargeted = isTargeted
                    }

            }
            KanbanView(title: "", isTargeted: false, tasks: $mainTasks, mainTasks: $mainTasks)

            
        }
        .padding()
    }
}
//
//#Preview {
//    ContentView()
//}

