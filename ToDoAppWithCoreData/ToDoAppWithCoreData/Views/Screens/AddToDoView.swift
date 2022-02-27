//
//  AddToDoView.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI
import CloudKit

struct AddToDoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var detail: String = ""

    
    var body: some View {
        
            VStack {

                FormView()
                          
                Spacer()
                
                Button {
                    addItem()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ItemButton(color: .blue, title: "Save")
                }
            }//: VSTACK
            
        
    }//: VIEW
    
    
    // MARK: FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = ItemEntity(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = name
            newItem.detail = detail
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func checkInputValue() {
        if name.isEmpty || detail.isEmpty {
            
        }
    }
    
    
//    private func saveItemCloudKit(record: CKRecord) {
//        CKContainer.default().publicCloudDatabase.save(record) { record, error in
//            print(record)
//        }
//    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
