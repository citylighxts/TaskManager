//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add new task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add new group") {
                    
                }
            }
        }
        
        WindowGroup("Special Window") {
            Text("This is Special Window")
                .frame(minWidth: 200, idealWidth: 300, maxWidth: 500)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Settings")
                .frame(minWidth: 200, maxWidth: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do something amazing") {
                
            }
        }
    }
}
