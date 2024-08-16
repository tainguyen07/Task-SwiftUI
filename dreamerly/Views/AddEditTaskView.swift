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
    var taskListViewModel: TaskListViewModel

    var body: some View {
        Form {
            TextField("Title", text: $viewModel.task.title)
            
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
            viewModel.saveTask()
            taskListViewModel.loadTasks() // Refresh the task list in TaskListViewModel
            presentationMode.wrappedValue.dismiss()
        })
    }
}

//#Preview {
//    AddEditTaskView()
//}
