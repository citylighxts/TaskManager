//
//  TaskGroup.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var creationDate: Date
    var Tasks: [Task]
    
    init(title: String, Tasks: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.Tasks = Tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Belajar Swift")
        let task2 = Task(title: "Belajar React")
        let task3 = Task(title: "Belajar OpenCV")
        
        var group = TaskGroup(title: "Belajar")
        group.Tasks = [task1, task2, task3]
        return group
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "New List")
        return [group1, group2]
    }
}
