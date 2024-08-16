//
//  CalenderView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

struct CalenderView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Text("Select Due Date")
                .font(.headline)
            
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
        }
        .padding()
    }
}

//#Preview {
//    CalenderView()
//}
