//
//  HomeView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @State private var showAddNewTask = false
    @State private var searchText = ""
    
    //MARK: - UI
    var body: some View {
        ZStack {
            
            NavigationView {
                VStack {
                    SearchBar(text: $searchText)
                    ListView($searchText, $showAddNewTask)
                    
                }
            }
            .rotation3DEffect(
                Angle(
                    degrees: showAddNewTask ? 5 : 0),
                axis: (x: 1, y: 0, z: 0)
            )
            .animation(.easeOut)
            
            if showAddNewTask {
                BlankView(backgroundColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showAddNewTask.toggle()
                    }
                
                AddNewItem(
                    keyboardHelper: KeyboardHeightHelper(),
                    isShow: $showAddNewTask)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(
                        stiffness: 200,
                        damping: 25,
                        initialVelocity: 10)
                    )
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
