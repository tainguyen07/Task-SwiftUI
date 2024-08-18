//
//  TaskService.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

class TaskService {
    private let persistenceService = PersistenceService()
    
    func loadTasks() -> [Task] {
        return persistenceService.loadTasks()
    }
    
    func saveTask(_ task: Task) {
        var tasks = loadTasks()
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        } else {
            tasks.append(task)
        }
        persistenceService.saveTasks(tasks)
        NotificationService.scheduleReminderNotification(for: task)
    }
    
    func saveTasks(_ tasks: [Task]) {
        persistenceService.saveTasks(tasks)
    }
    
    func deleteTask(_ task: Task) {
        var tasks = loadTasks()
        tasks.removeAll { $0.id == task.id }
        persistenceService.saveTasks(tasks)
    }
}
