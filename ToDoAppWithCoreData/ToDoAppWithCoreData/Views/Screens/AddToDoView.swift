//
//  AddToDoView.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct AddToDoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var detail: String = ""

    
    var body: some View {
        NavigationView {
            VStack(spacing: 70) {
                TextField("What's your task?", text: $name)
                  .padding()
                  .background(Color(UIColor.tertiarySystemFill))
                  .cornerRadius(9)
                  .font(.system(size: 24, weight: .bold, design: .default))
                
                TextField("How to resolve?", text: $detail)
                    .frame(height: 300)
                  .padding()
                  .background(Color(UIColor.tertiarySystemFill))
                  .cornerRadius(9)
                  .font(.system(size: 24, weight: .bold, design: .default))
                Button {
                    addItem()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ItemButton(color: .blue, title: "Save")
                }
            }//: VSTACK
            .navigationBarItems(trailing:
              Button{
                self.presentationMode.wrappedValue.dismiss()
            }label: {
                Image(systemName: "xmark")
            })
        }
    }
    
    
    // MARK: FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = name
            newItem.detail = detail
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
