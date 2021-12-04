//
//  Item+CoreDataProperties.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//
//

import Foundation
import CoreData


extension Item {
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var priority: Int32
    @NSManaged public var isCompleted: Bool
}

extension Item : Identifiable {
    var wrappedPriority: ToDoItem.Priority {
        get {
            ToDoItem.Priority(rawValue: Int(priority)) ?? .normal
        }
        set {
            self.priority = Int32(newValue.rawValue)
        }
    }
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var wrappedName: String {
        name ?? "unknown name"
    }
}
