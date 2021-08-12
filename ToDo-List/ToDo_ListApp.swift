//
//  ToDo_ListApp.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

@main
struct ToDo_ListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
