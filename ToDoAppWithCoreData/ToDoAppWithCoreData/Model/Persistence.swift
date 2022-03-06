//
//  Persistence.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

//import CoreData
//
//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = ItemEntity(context: viewContext)
//            newItem.timestamp = Date()
//            newItem.title = "mock data"
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()
//
//    let container: NSPersistentCloudKitContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentCloudKitContainer(name: "ToDoAppWithCoreData")
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//
//        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
//    }
//}
