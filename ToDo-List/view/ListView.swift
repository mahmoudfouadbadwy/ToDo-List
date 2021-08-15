//
//  ListView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI
import CoreData

struct ListView: View {
    
    @Environment(\.managedObjectContext) var context
    @State private var filter = false
    @Binding var showAddNewTask: Bool
    @Binding var searchText: String
    
    private var fetchRequest: FetchRequest<Item>
    private var items: FetchedResults<Item> {
        fetchRequest.wrappedValue
    }
    private var filterdItemsByComplete: [Item] {
        items.filter {
            !filter || $0.isCompleted
        }
    }
    
    init(_ searchText: Binding<String>, _ showAddingTask: Binding<Bool>) {
        self._searchText = searchText
        self._showAddNewTask = showAddingTask
        let predicate = searchText.wrappedValue.isEmpty ?
            NSPredicate(value: true) :
            NSPredicate(format: "name CONTAINS[c] %@", searchText.wrappedValue)
        
        self.fetchRequest = FetchRequest(entity: Item.entity(),
                                         sortDescriptors: [ NSSortDescriptor(keyPath:
                                                                                \Item.priority, ascending: false) ], predicate: predicate,
                                         animation: .default)
    }
    
    var body: some View {
        ZStack {
            if items.isEmpty {
                EmptyView()
            }
            
            List {
                if !items.isEmpty {
                    Toggle(isOn: $filter.animation(), label: {
                        Text("Show Completed Only")
                    })
                }
                
                ForEach(filterdItemsByComplete) { item in
                    ToDoListRow(todoItem: item)
                }
                .onDelete(perform: deleteItem(indexSet:))
            }
            .listSeparatorStyle(style: .none)
            .navigationBarTitle("ToDo Items", displayMode: .large)
            .navigationBarItems(leading: EditButton()
                                    .disabled(items.isEmpty),
                                trailing: Button(action: {
                                    self.showAddNewTask.toggle()
                                },
                                label: {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.purple)
                                        .font(.largeTitle)
                                })
            )

        }
    }
    
    private func deleteItem(indexSet: IndexSet) {
        for index in indexSet {
            let item = items[index]
            context.delete(item)
        }
        do {
            try context.save()
        } catch {
            print("Can not delete \(error.localizedDescription)")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(.constant(""), .constant(false))
    }
}
