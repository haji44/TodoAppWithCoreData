//
//  TestApp.swift
//  Test
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

@main
struct TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
