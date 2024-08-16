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
                ForEach(viewModel.tasks) { task in
                    NavigationLink(destination: TaskDetailView(viewModel: TaskDetailViewModel(task: task))) {
                        TaskRowView(task: task)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.deleteTask(viewModel.tasks[index])
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
                TaskDetailView(viewModel: TaskDetailViewModel(task: task))
            }
        }
    }
}

#Preview {
    TaskListView()
}
