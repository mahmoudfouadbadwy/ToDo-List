//
//  ToDoItem.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import Foundation
import SwiftUI

class ToDoItem {
    
    enum Priority: Int, CaseIterable {
       
        case low = 0
        case normal
        case high
        
        var title: String {
            switch self {
            case .low : return "Low"
            case .normal : return "Normal"
            case .high : return "High"
            }
        }
        
        var color: Color {
            switch self {
            case .low : return    .green
            case .normal : return .orange
            case .high : return   .red
            }
        }
    
    }
}
