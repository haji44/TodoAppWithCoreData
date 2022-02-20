//
//  Item.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import Foundation

struct TodoItem : Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var date: String
    var isDone: Bool
}

struct MockItem {
    static var sample = TodoItem(title: "test title", description: "This is a test description", date: "2020/02/20", isDone: false)
}
