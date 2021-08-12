//
//  ListView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/12/21.
//

import SwiftUI

struct ListView: View {
    @Binding var items: [ToDoItem]
    var body: some View {
        List {
            ForEach(items) { item in
                ToDoListRow(todoItem: item)
            }
        }
        .listSeparatorStyle(style: .none)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(items: .constant([]))
    }
}
