//
//  TaskDetailView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var viewModel: TaskDetailViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                Text(viewModel.task.title)
                Text("Due: \(viewModel.task.dueDate, formatter: dateFormatter)")
                Text("Priority: \(viewModel.task.priority.rawValue)")
                Text("Category: \(viewModel.task.category.rawValue)")
            }
            
            Section(header: Text("Subtasks")) {
                ForEach(viewModel.task.subtasks) { subtask in
                    HStack {
                        Text(subtask.title)
                        Spacer()
                        Button(action: {
                            viewModel.toggleSubtaskCompletion(subtask)
                        }) {
                            Image(systemName: subtask.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Task Details")
        .navigationBarItems(trailing: Button("Complete Task") {
            viewModel.markTaskAsCompleted()
        })
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
