//
//  ItemEntity+CoreDataProperties.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/06.
//
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var detail: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var title: String?
    
    static func fetch(context: NSManagedObjectContext) -> [ItemEntity] {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        do {
            return try context.fetch(request)
        } catch let error{
            print("Error \(error)")
            return []
        }
    }
    
    static func add(title: String, detail: String, due: Date) {
        let newItem = ItemEntity(context: PersistenceController.shared.viewContext)
        newItem.createDate = Date()
        newItem.isDone = false
        newItem.title = title
        newItem.detail = detail
        newItem.dueDate = due
        PersistenceController.shared.save()
    }
    
    static func delete(item: ItemEntity) {
        PersistenceController.shared.viewContext.delete(item)
        PersistenceController.shared.save()
    }
}

extension ItemEntity : Identifiable {

}
