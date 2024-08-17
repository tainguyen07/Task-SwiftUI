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
    
    var body: some View {
        NavigationStack {
            List {
                // Section for incomplete tasks
                Section(header: Text("Incomplete Tasks")) {
                    ForEach(viewModel.tasks.filter { !$0.isCompleted }) { task in
                        NavigationLink(value: task) {
                            TaskRowView(task: task)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = viewModel.tasks.filter { !$0.isCompleted }[index]
                            viewModel.deleteTask(task)
                        }
                    }
                }
                
                // Section for completed tasks
                Section(header: Text("Completed Tasks")) {
                    ForEach(viewModel.tasks.filter { $0.isCompleted }) { task in
                        NavigationLink(value: task) {
                            TaskRowView(task: task)
                        }
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
            }) {
                Image(systemName: "plus")
            })
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
