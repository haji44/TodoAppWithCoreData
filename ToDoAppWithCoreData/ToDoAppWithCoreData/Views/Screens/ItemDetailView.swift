//
//  ItemDetailView.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemDetailView: View {
    
    var title: String
    var description: String

    var body: some View {
        VStack {
            Text("Title: \(title)")
            Text("Description: \(description)")
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(title: "test title", description: "test description will asssing detatl imformation about event")
    }
}
