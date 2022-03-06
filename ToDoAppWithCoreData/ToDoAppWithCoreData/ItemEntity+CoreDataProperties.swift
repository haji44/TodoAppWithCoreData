//
//  ItemEntity+CoreDataProperties.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/26.
//
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var detail: String
    @NSManaged public var done: Bool
    @NSManaged public var id: UUID
    @NSManaged public var timestamp: Date
    @NSManaged public var title: String

}

extension ItemEntity : Identifiable {

}
