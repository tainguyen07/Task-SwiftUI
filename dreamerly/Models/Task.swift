//
//  Task.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import Foundation

enum TaskPriority: String, Codable, CaseIterable, Hashable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

enum TaskCategory: String, Codable, CaseIterable, Hashable {
    case work = "Work"
    case personal = "Personal"
    case others = "Others"
}

struct Task: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var dueDate: Date
    var priority: TaskPriority
    var category: TaskCategory
    var isCompleted: Bool = false
    var reminderDate: Date? = nil // Optional reminder date
    var subtasks: [Subtask] = [] // Add an array of subtasks

    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
