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
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var priority: Int32
    @NSManaged public var isCompleted: Bool
    
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "unknown name"
    }
    
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
}
