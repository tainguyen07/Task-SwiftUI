//
//  CalendarView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import SwiftUI

struct CalendarView: View {
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
//    CalendarView()
//}
