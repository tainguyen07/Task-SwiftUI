//
//  PersistenceService.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

class PersistenceService {
    private let tasksKey = "tasks"
    
    func loadTasks() -> [Task] {
        if let savedTasks = UserDefaults.standard.data(forKey: tasksKey) {
            let decoder = JSONDecoder()
            if let loadedTasks = try? decoder.decode([Task].self, from: savedTasks) {
                return loadedTasks
            }
        }
        return []
    }
    
    func saveTasks(_ tasks: [Task]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)
        }
    }
}
