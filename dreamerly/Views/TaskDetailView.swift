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
    @State private var newSubtaskTitle: String = ""
    @State private var isSubtasksExpanded: Bool = true // State to track expansion/collapse
    @State private var errorMessage: String? = nil  // State to track error messages

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $viewModel.task.title)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
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
            Section(header: subtaskSectionHeader()) {
                if isSubtasksExpanded {
                    ForEach(viewModel.task.subtasks) { subtask in
                        HStack {
                            Button(action: {
                                viewModel.toggleSubtaskCompletion(subtask)
                            }) {
                                Image(systemName: subtask.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(subtask.isCompleted ? .green : .gray)
                            }
                            
                            Text(subtask.title)
                                .strikethrough(subtask.isCompleted)
                        }
                    }
                    
                    HStack {
                        TextField("New Subtask", text: $newSubtaskTitle)
                        Button(action: {
                            if newSubtaskTitle.isEmpty {
                                errorMessage = "Subtask title cannot be empty."
                            } else {
                                viewModel.addSubtask(title: newSubtaskTitle)
                                newSubtaskTitle = ""
                                errorMessage = nil
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
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
    
    private func subtaskSectionHeader() -> some View {
        HStack {
            Text("Subtasks")
            Spacer()
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.3)) {
                    isSubtasksExpanded.toggle()
                }
            }) {
                Image(systemName: isSubtasksExpanded ? "chevron.down" : "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }
    
    // Provide a default binding for the DatePicker
    private func reminderBinding() -> Binding<Date> {
        Binding<Date>(
            get: { viewModel.task.reminderDate ?? Date() }, // Default to current date if nil
            set: { viewModel.task.reminderDate = $0 }
        )
    }
}
