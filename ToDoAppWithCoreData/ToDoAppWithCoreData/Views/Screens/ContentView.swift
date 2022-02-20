//
//  ContentView.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var isShowingModal: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ForEach(self.items,id: \.self) { item in
                            NavigationLink {
                                ItemDetailView(title: item.title ?? "", description: item.detail ?? "" )
                            } label: {
                                ItemCell(title: item.title ?? "", description: item.detail ?? "")
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Button {isShowingModal = true}
                label: { ItemButton(color: .green, title: "Add new Item") }
                }//: VSTACK
                .navigationTitle("TODO LIST")
            }//: NAVIGATION
        }//: ZSTACK
        .sheet(isPresented: $isShowingModal) {
            AddToDoView()
        }
    }
    
//    // MARK: FUNCTION
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            newItem.title = "New item"
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
