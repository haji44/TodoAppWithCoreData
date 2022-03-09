//
//  ToListViewModel.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/04.
//

import SwiftUI
import CoreData

class TodoListViewModel: ObservableObject {
    @Published var items: [ItemEntity] = []
    
    init () {
        fetch()
    }
    
    func fetch() {
        items = ItemEntity.fetch()
    }
    
    func remove(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            ItemEntity.delete(item: item)            
        }
        fetch()
    }
    
    func add(title: String, detail: String, due: Date) {
        ItemEntity.add(title: title, detail: detail, due: due)
        fetch()
    }

    func update(item: ItemEntity) {
        ItemEntity.update(item: item)
        fetch()
    }
}
