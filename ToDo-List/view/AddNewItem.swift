//
//  AddNewItem.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI

struct AddNewItem: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var keyboardHelper: KeyboardHeightHelper
    @Binding var isShow: Bool
    @State private var priority = ToDoItem.Priority.normal
    @State private  var name = ""
    @State private var isEditing = false
   
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Add a new task")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        self.isShow = false
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                
                TextField("Enter the task name", text: $name, onEditingChanged: { (editingChanged) in
                    
                    self.isEditing = editingChanged
                    
                })
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom)
                
                Text("Priority")
                    .font(.system(.subheadline, design: .rounded))
                    .padding(.bottom)
                
                HStack {
                    ForEach(ToDoItem.Priority.allCases, id: \.self) { priority in
                        Text(priority.title)
                            .font(.system(.headline, design: .rounded))
                            .padding(10)
                            .background(self.priority == priority ?
                                        priority.color : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .onTapGesture {
                                self.priority = priority
                                
                            }
                    }
                }
                .padding(.bottom, 30)
                
                // Save button for adding the todo item
                Button(action: {
                    
                    if self.name.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }
                    
                    self.isShow.toggle()
                    self.addTask(name: self.name, priority: self.priority)
                    
                }) {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding(.bottom)
               
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -self.keyboardHelper.keyboardHeight : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addTask(name: String, priority: ToDoItem.Priority, isComplete: Bool = false) {
        let task = Item(context: context)
        task.id = UUID()
        task.name = name
        task.wrappedPriority = priority
        task.isCompleted = isComplete
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem(keyboardHelper: KeyboardHeightHelper(), isShow: .constant(true))
    }
}
