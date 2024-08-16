//
//  TaskDetailViewModel.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    func toggleSubtaskCompletion(_ subtask: Subtask) {
        if let index = task.subtasks.firstIndex(where: { $0.id == subtask.id }) {
            task.subtasks[index].isCompleted.toggle()
        }
    }
    
    func markTaskAsCompleted() {
        task.isCompleted = true
    }
}
