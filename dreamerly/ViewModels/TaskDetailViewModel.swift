//
//  TaskDetailViewModel.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var task: Task
    var taskListViewModel: TaskListViewModel
    
    init(task: Task, taskListViewModel: TaskListViewModel) {
        self.task = task
        self.taskListViewModel = taskListViewModel
    }
    
    func saveTask() {
        taskListViewModel.updateTask(task)
    }
    
    func markTaskAsCompleted() {
        task.isCompleted = true
        saveTask()
    }
    
    func unmarkTaskAsCompleted() {
        task.isCompleted = false
        saveTask()
    }
    
    func toggleSubtaskCompletion(_ subtask: Subtask) {
        if let index = task.subtasks.firstIndex(where: { $0.id == subtask.id }) {
            task.subtasks[index].isCompleted.toggle()
            saveTask()
        }
    }
    
    func addSubtask(title: String) {
        let newSubtask = Subtask(title: title, isCompleted: false)
        task.subtasks.append(newSubtask)
        saveTask()
    }
}
