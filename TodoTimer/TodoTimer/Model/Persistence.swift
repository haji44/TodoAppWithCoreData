//
//  Persistence.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/04.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
       
    var container: NSPersistentCloudKitContainer
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "TodoTimer")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
