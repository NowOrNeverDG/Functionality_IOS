//
//  KanbanView.swift
//  [SwiftUI]Dragable
//
//  Created by Ge Ding on 11/17/23.
//

import SwiftUI

struct KanbanView: View {

    let title: String
    let isTargeted: Bool
    
    @StateObject var vm = ViewModel()
    @Binding var tasks: [String]
    @Binding var mainTasks: [String]
    
    @State private var editedtext: String = ""
    @State var isEditing : Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? .teal.opacity(0.15) : Color(.secondarySystemFill))

                VStack(alignment: .leading, spacing: 5) {
                    ForEach(tasks.indices, id: \.self) { index in
                        VStack(alignment: .leading){
                            if isEditing {
                                TextField("", text: $editedtext, onCommit: {
                                    tasks[index] = self.editedtext
                                    mainTasks[index] = self.editedtext
                                    isEditing = false
                                })
                                .padding(5)
                                .background(Color(uiColor: .secondarySystemGroupedBackground))
                                .cornerRadius(1)
                                .shadow(radius: 1, x: 1, y: 1)
                            } else {
                                Text(tasks[index])
                                    .padding(5)
                                    .background(Color(uiColor: .secondarySystemGroupedBackground))
                                    .cornerRadius(1)
                                    .shadow(radius: 1, x: 1, y: 1)
                                    .draggable(tasks[index])
                                    .onTapGesture(count: 2) {
                                        // Enable editing mode on double-tap
                                        isEditing = true
                                    }
                            }
                            
                        }
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}

//#Preview {
//    @State var tasks = ["Go to work"]
//    KanbanView(title: "", isTargeted: false, tasks: tasks)
//}
