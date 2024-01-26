//
//  TaskView.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    @Binding var selectedTask: Task?
    @Binding var inspectorIsShown: Bool
    
//    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
            
            Button {
                inspectorIsShown = true
                selectedTask = task
                
//                openWindow(id: String, value: T##Decodable & Encodable & Hashable)
            } label: {
                Text("More")
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), inspectorIsShown: .constant(false))
}
