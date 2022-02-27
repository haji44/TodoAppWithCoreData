//
//  ToDoAppWithCoreDataApp.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

@main
struct ToDoAppWithCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
