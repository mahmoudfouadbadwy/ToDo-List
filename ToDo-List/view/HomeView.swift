//
//  HomeView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var items: [String] = []
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    .navigationBarTitle("ToDo Items", displayMode: .large)
                    .navigationBarItems(trailing: Button(action: {
                        
                    },
                                                         label: {
                                                            Image(systemName: "plus.circle.fill")
                                                                .foregroundColor(.purple)
                                                                .font(.largeTitle)
                                                         })
                    )
                }
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                }
            }
            
            if items.isEmpty {
                EmptyView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
