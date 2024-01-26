//
//  Task.swift
//  TaskManager
//
//  Created by Hana Azizah on 26/01/24.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(title: "Belajar Swift", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Tugas 1", dueDate: Date()),
            Task(title: "Tugas 2", dueDate: Date()),
            Task(title: "Tugas 3", dueDate: Date())
        ]
    }
}
