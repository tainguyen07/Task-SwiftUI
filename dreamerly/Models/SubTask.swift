//
//  SubTask.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation

struct Subtask: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    
    static func == (lhs: Subtask, rhs: Subtask) -> Bool {
        return lhs.id == rhs.id
    }
}
