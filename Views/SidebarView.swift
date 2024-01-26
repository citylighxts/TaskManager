//
//  SidebarView.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?
    
    var body: some View {
        List(selection: $selection) {
            Section("Favorites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName,
                          systemImage: selection.iconName)
                    .tag(selection)
                }
            }
                
            Section("Your Groups") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                        .tag(TaskSection.list(group))
                        .contextMenu {
                            Button("Delete", role: .destructive) {
                                if let index = userCreatedGroups.firstIndex(where: {
                                    $0.id == group.id
                                }) {
                                    userCreatedGroups.remove(at: index)
                                }
                            }
                        }
                }
            }
        }
        
        .safeAreaInset(edge: .bottom) {
            Button {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            } label: {
                Label("Add Group", systemImage: "plus.circle")
            }
            .buttonStyle(.borderless)
            .foregroundColor(.blue)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
