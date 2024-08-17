//
//  DashboardView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 18/8/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: TaskListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Task Statistics")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Tasks")
                        .font(.headline)
                    Text("\(viewModel.totalTasksCount)")
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Completed Tasks")
                        .font(.headline)
                    Text("\(viewModel.completedTasksCount)")
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Pending Tasks")
                        .font(.headline)
                    Text("\(viewModel.pendingTasksCount)")
                        .font(.title)
                }
            }
            .padding(.horizontal)
            
            ProgressView(value: viewModel.completionPercentage)
                .progressViewStyle(LinearProgressViewStyle())
                .padding(.horizontal)
            
            Text("Completion: \(Int(viewModel.completionPercentage * 100))%")
                .font(.headline)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Dashboard")
    }
}

//#Preview {
//    DashboardView()
//}
