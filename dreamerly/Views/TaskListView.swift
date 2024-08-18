//
//  TaskListView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var isAddingTask = false
    @State private var isShowingDashboard = false
    
    var body: some View {
        NavigationStack {
            List {
                // Section for incomplete tasks with drag-and-drop functionality
                Section(header: Text("Incomplete Tasks")) {
                    ForEach(viewModel.tasks.filter { !$0.isCompleted }) { task in
                        NavigationLink(value: task) {
                            TaskRowView(task: task)
                        }
                    }
                    .onMove { indices, newOffset in
                        viewModel.moveTask(from: indices, to: newOffset)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = viewModel.tasks.filter { !$0.isCompleted }[index]
                            viewModel.deleteTask(task)
                        }
                    }
                }
                
                // Section for completed tasks with drag-and-drop functionality
                Section(header: Text("Completed Tasks")) {
                    ForEach(viewModel.tasks.filter { $0.isCompleted }) { task in
                        NavigationLink(value: task) {
                            TaskRowView(task: task)
                        }
                    }
                    .onMove { indices, newOffset in
                        viewModel.moveTask(from: indices, to: newOffset)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = viewModel.tasks.filter { $0.isCompleted }[index]
                            viewModel.deleteTask(task)
                        }
                    }
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                isAddingTask = true
                HapticFeedback.triggerHapticFeedback()
            }) {
                Image(systemName: "plus")
            })
            .navigationBarItems(leading: Button(action: {
                isShowingDashboard = true
                HapticFeedback.triggerHapticFeedback()
            }) {
                Text("Dashboard")
            })
            .navigationDestination(isPresented: $isShowingDashboard) {
                DashboardView(viewModel: viewModel)
            }
            .navigationDestination(isPresented: $isAddingTask) {
                AddEditTaskView(viewModel: AddEditTaskViewModel(), taskListViewModel: viewModel)
            }
            .navigationDestination(for: Task.self) { task in
                TaskDetailView(viewModel: TaskDetailViewModel(task: task, taskListViewModel: viewModel))
            }
        }
    }
    
}

#Preview {
    TaskListView()
}
