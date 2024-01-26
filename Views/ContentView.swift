//
//  ContentView.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var selection: TaskSection? = TaskSection.all
    @State private var allTasks = Task.examples()
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter( {
                        $0.isCompleted
                    }))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter( {
                        !$0.isCompleted
                    }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: allTasks)
                case .none:
                    Text("none")
                }
            } else {
                StaticTaskListView(title: "Done", tasks: allTasks.filter( {
                    $0.title.contains(searchTerm)
                }))
            }
            
        }
        .searchable(text: $searchTerm)

    }
}

#Preview {
    ContentView()
}
