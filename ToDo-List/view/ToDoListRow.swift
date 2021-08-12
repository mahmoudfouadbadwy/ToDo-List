//
//  ToDoListRow.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI

struct ToDoListRow: View {
    @ObservedObject var todoItem: Item
    var body: some View {
        Toggle(isOn: self.$todoItem.isCompleted) {
            HStack {
                Text(self.todoItem.wrappedName)
                    .strikethrough(self.todoItem.isCompleted, color: .black)
                    .bold()
                    .animation(.default)
                
                Spacer()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(self.color(for: self.todoItem.wrappedPriority))
            }
        }
        .toggleStyle(CheckBoxStyle())
    }
    
    private func color(for priority: ToDoItem.Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) static var context
    static var previews: some View {
        ToDoListRow(todoItem: Item(context: context))
    }
}





