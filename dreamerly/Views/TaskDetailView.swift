//
//  TaskDetailView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var viewModel: TaskDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isModified = false
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $viewModel.task.title)
                    .onChange(of: viewModel.task.title) { _ in
                        checkIfModified()
                    }
                
                DatePicker("Due Date", selection: $viewModel.task.dueDate, displayedComponents: .date)
                    .onChange(of: viewModel.task.dueDate) { _ in
                        checkIfModified()
                    }
                
                Picker("Priority", selection: $viewModel.task.priority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .onChange(of: viewModel.task.priority) { _ in
                    checkIfModified()
                }
                
                Picker("Category", selection: $viewModel.task.category) {
                    ForEach(TaskCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .onChange(of: viewModel.task.category) { _ in
                    checkIfModified()
                }
            }
            
            
        }
        .navigationBarTitle("Task Details")
        .navigationBarItems(
            trailing: HStack {
                Button("Save") {
                    viewModel.saveTask()
                    isModified = false
                    presentationMode.wrappedValue.dismiss() // Ensure the view dismisses after saving
                }
                .disabled(!isModified)
                
                Button(viewModel.task.isCompleted ? "Uncomplete Task" : "Complete Task") {
                    if viewModel.task.isCompleted {
                        viewModel.unmarkTaskAsCompleted()
                    } else {
                        viewModel.markTaskAsCompleted()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        )
    }
    
    private func checkIfModified() {
        isModified = true
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
