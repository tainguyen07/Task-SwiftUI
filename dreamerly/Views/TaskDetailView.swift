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
                        isModified = true
                    }
                
                DatePicker("Due Date", selection: $viewModel.task.dueDate, displayedComponents: .date)
                    .onChange(of: viewModel.task.dueDate) { _ in
                        isModified = true
                    }
                
                if let _ = viewModel.task.reminderDate {
                    DatePicker("Reminder", selection: reminderBinding(), displayedComponents: [.date, .hourAndMinute])
                        .onChange(of: viewModel.task.reminderDate) { _ in
                            isModified = true
                        }
                    
                    Button("Clear Reminder") {
                        viewModel.task.reminderDate = nil
                        isModified = true
                    }
                } else {
                    Button("Set Reminder") {
                        viewModel.task.reminderDate = Date()
                        isModified = true
                    }
                }
                
                Picker("Priority", selection: $viewModel.task.priority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .onChange(of: viewModel.task.priority) { _ in
                    isModified = true
                }
                
                Picker("Category", selection: $viewModel.task.category) {
                    ForEach(TaskCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .onChange(of: viewModel.task.category) { _ in
                    isModified = true
                }
            }
        }
        .navigationBarTitle("Task Details")
        .navigationBarItems(
            trailing: HStack {
                Button("Save") {
                    HapticFeedback.triggerHapticFeedback()
                    viewModel.saveTask()
                    isModified = false
                    presentationMode.wrappedValue.dismiss() // Ensure the view dismisses after saving
                }
                .disabled(!isModified)
                
                Button(viewModel.task.isCompleted ? "Uncomplete Task" : "Complete Task") {
                    HapticFeedback.triggerHapticFeedback()
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
    
    // Provide a default binding for the DatePicker
    private func reminderBinding() -> Binding<Date> {
        Binding<Date>(
            get: { viewModel.task.reminderDate ?? Date() }, // Default to current date if nil
            set: { viewModel.task.reminderDate = $0 }
        )
    }
}
