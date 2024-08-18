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
    
    var completedTasksCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    var pendingTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var totalTasksCount: Int {
        tasks.count
    }
    
    var completionPercentage: Double {
        guard totalTasksCount > 0 else { return 0 }
        return Double(completedTasksCount) / Double(totalTasksCount)
    }
    
    // Function to move tasks within the list
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
        taskService.saveTasks(tasks) // Save the reordered tasks
    }
}
