//
//  SubTask.swift
//  dreamerly
//
//  Created by Tai Nguyen on 18/8/24.
//

import Foundation

struct Subtask: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
