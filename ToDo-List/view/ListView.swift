//
//  ListView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var context
    var items: FetchedResults<Item>?
    var body: some View {
        List {
            ForEach(items!) { item in
                ToDoListRow(todoItem: item)
            }
            .onDelete(perform: deleteItem(indexSet:))
        }
        .listSeparatorStyle(style: .none)
    }
    
    private func deleteItem(indexSet: IndexSet) {
        guard let items = items else {
            return
        }
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
