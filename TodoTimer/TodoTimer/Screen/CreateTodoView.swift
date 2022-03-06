//
//  CreateTodoView.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/05.
//

import SwiftUI

struct CreateTodoView: View {

    @EnvironmentObject var viewModel: TodoListViewModel
    @State var title: String = ""
    @State var detail: String = ""
    @State var date: Date = Date()
    @Binding var isShowingCreateModal: Bool
    
    var body: some View {
            Form {
                Section {
                    TextField("title", text: $title)
                    TextField("detail", text: $detail)
                    
                    DatePicker("", selection: $date)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                    
                }//: SECTION
            }//: FORM
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.add(title: title, detail: detail, due: date)
                        isShowingCreateModal = false
                    } label: {
                        Text("save")
                            .foregroundColor(.blue)
                    }
                }
            }//: TOOLBAR        
    }//: BODY
}

//struct CreateTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTodoView()
//    }
//}
