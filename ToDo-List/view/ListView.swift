//
//  ListView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var context
    @State private var filter = false
    var items: FetchedResults<Item>!
    private var filterdItems: [Item] {
        items.filter {
            !filter || $0.isCompleted
        }
    }
    var body: some View {
        List {
            if !items.isEmpty {
                Toggle(isOn: $filter.animation(), label: {
                    Text("Show Completed Only")
                })
            }
            
            ForEach(filterdItems) { item in
                ToDoListRow(todoItem: item)
            }
            .onDelete(perform: deleteItem(indexSet:))
        }
        .listSeparatorStyle(style: .none)
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
        ListView()
    }
}
