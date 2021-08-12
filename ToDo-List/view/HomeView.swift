//
//  HomeView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var items: [ToDoItem] = []
    @State private var showAddNewTask = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ListView(items: $items)
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
            }
            .rotation3DEffect(Angle(degrees: showAddNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .animation(.easeOut)
            
            if items.isEmpty {
                EmptyView()
            }
            
            if showAddNewTask {
                BlankView(backgroundColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showAddNewTask.toggle()
                    }
                
                AddNewItem(isShow: $showAddNewTask, items: $items)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
