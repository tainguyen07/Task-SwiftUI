//
//  TaskListViewModel.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private var taskService: TaskService
    
    init(taskService: TaskService = TaskService()) {
        self.taskService = taskService
        loadTasks()
    }
    
    func loadTasks() {
        tasks = taskService.loadTasks()
    }
    
    func addTask(_ task: Task) {
        taskService.saveTask(task)
        loadTasks()
    }
    
    func updateTask(_ task: Task) {
        taskService.saveTask(task)
        loadTasks()
    }
    
    func deleteTask(_ task: Task) {
        taskService.deleteTask(task)
        loadTasks()
    }
}
