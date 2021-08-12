//
//  HomeView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var items: [String] = []
    @State private var showAddNewTask = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }
                .navigationBarTitle("ToDo Items", displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    self.showAddNewTask.toggle()
                },
                label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.purple)
                        .font(.largeTitle)
                })
                )
                .listSeparatorStyle(style: .none)
            }
            
            if items.isEmpty {
                EmptyView()
            }
            
            if showAddNewTask {
                BlankView(backgroundColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showAddNewTask.toggle()
                    }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
