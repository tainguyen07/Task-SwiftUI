//
//  TaskRowView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var onToggleComplete: (Task) -> Void
    var showButton: Bool = false  // Add a flag to control the visibility of the button

    var body: some View {
        HStack {
            if showButton {
                Button(action: {
                    onToggleComplete(task)
                }) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
            }
            Text(task.title)
                .font(.headline)
                .strikethrough(task.isCompleted)
            Spacer()
            Text(task.priority.rawValue)
                .padding(5)
                .background(priorityColor(task.priority))
                .cornerRadius(5)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
        .shadow(radius: 1)
    }
    
    func priorityColor(_ priority: TaskPriority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .yellow
        case .low:
            return .green
        }
    }
}

//#Preview {
//    TaskRowView()
//}
