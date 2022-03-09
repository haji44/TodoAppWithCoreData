//
//  TodoTimerApp.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/04.
//

import SwiftUI

@main
struct TodoTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            TimerView(referenceDate: Date(timeIntervalSinceNow: 86400))
            TodoListView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
