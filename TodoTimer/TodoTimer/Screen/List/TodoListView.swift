//
//  ContentView.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/04.
//

import SwiftUI
import CoreData

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    @State var isShowingCreateModal: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item.title ?? "")
                    }
                    .onDelete(perform: viewModel.remove)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isShowingCreateModal = true
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.blue)
                        }
                    }
                }
                .navigationTitle("Task")
            }//: NAVIGATION
            .sheet(isPresented: $isShowingCreateModal) {
                NavigationView{
                    CreateTodoView(isShowingCreateModal: $isShowingCreateModal).environmentObject(viewModel)
                }
            }
        }//: ZSTACK
    }//: BODY
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
