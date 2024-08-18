//
//  AddEditTaskView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

struct AddEditTaskView: View {
    @ObservedObject var viewModel: AddEditTaskViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var errorMessage: String? = nil  // State to track error messages
    var taskListViewModel: TaskListViewModel
    
    var body: some View {
        Form {
            TextField("Title", text: $viewModel.task.title)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            DatePicker("Due Date", selection: $viewModel.task.dueDate, displayedComponents: .date)
            
            Picker("Priority", selection: $viewModel.task.priority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Text(priority.rawValue).tag(priority)
                }
            }
            
            Picker("Category", selection: $viewModel.task.category) {
                ForEach(TaskCategory.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }
        }
        .navigationBarTitle("Add/Edit Task")
        .navigationBarItems(trailing: Button("Save") {
            if viewModel.task.title.isEmpty {
                errorMessage = "Task title cannot be empty."
            } else {
                HapticFeedback.triggerHapticFeedback()
                viewModel.saveTask()
                taskListViewModel.loadTasks() // Refresh the task list in TaskListViewModel
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

//#Preview {
//    AddEditTaskView()
//}
