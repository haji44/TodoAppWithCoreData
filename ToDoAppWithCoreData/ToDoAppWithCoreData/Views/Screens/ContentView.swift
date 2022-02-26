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
        sortDescriptors: [NSSortDescriptor(keyPath: \ItemEntity.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<ItemEntity>
    
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
