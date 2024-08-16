//
//  TaskRowView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Text(task.priority.rawValue)
                .padding(5)
                .background(priorityColor(task.priority))
                .cornerRadius(5)
                .foregroundColor(.white)
        }
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
