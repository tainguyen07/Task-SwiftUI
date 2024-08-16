//
//  AddEditTaskViewModel.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

class AddEditTaskViewModel: ObservableObject {
    @Published var task: Task
    private var taskService: TaskService
    
    init(task: Task = Task(title: "", dueDate: Date(), priority: .medium, category: .work), taskService: TaskService = TaskService()) {
        self.task = task
        self.taskService = taskService
    }
    
    func saveTask() {
        taskService.saveTask(task)
    }
}
