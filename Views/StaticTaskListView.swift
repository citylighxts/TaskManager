//
//  TaskListView.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import SwiftUI

struct StaticTaskListView: View {
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
                    .padding(.vertical, 5)
            }
        }
    }
}

#Preview {
    StaticTaskListView(title: "All", tasks: Task.examples())
}  
