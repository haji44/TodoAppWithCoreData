//
//  ItemEntity+CoreDataProperties.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/06.
//
//

import Foundation
import CoreData
import SwiftUI


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var detail: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var title: String?

    var dueDate_: Date {
        if let dueDate = dueDate {
            return dueDate
        } else {
            return Date()
        }
    }

    static var viewContext: NSManagedObjectContext {
        PersistenceController.shared.viewContext
    }

    static func fetch() -> [ItemEntity] {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
//        request.predicate = NSPredicate(format: "%K == %@", "isDone", NSNumber(value: false))
        request.sortDescriptors = [NSSortDescriptor(key: "createDate", ascending: true)]
        do {
            return try viewContext.fetch(request)
        } catch let error{
            print("Error \(error)")
            return []
        }
    }
    
    static func add(title: String, detail: String, due: Date) {
        let newItem = ItemEntity(context: viewContext)
        newItem.createDate = Date()
        newItem.isDone = false
        newItem.title = title
        newItem.detail = detail
        newItem.dueDate = due
        save()
    }
    
    static func delete(item: ItemEntity) {
        viewContext.delete(item)
        save()
    }

    static func update(item: ItemEntity) {
        item.isDone.toggle()
        save()
    }

    static func save() {
        do {
            try viewContext.save()
        } catch {
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

extension ItemEntity : Identifiable {

}
