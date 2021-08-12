//
//  ToDoItem.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI



class ToDoItem: Identifiable, ObservableObject {
    
    var id = UUID()
    @Published var name: String
    @Published var priority: Priority = .normal
    @Published var isCompleted: Bool
    
    init(name: String, priority: Priority, isCompleted: Bool) {
        self.name = name
        self.priority = priority
        self.isCompleted = isCompleted
    }
    
    enum Priority: Int {
        case low = 0
        case normal
        case high
    }
}
