//
//  CreateTodoView.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/05.
//

import SwiftUI

struct CreateTodoView: View {

    @EnvironmentObject var todoVM: TodoListViewModel
    @State private var title: String = ""
    @State private var detail: String = ""
    @State private var date: Date = Date()
    @Binding var isShowingCreateModal: Bool
    private var disableButtton: Bool {
        title.isEmpty || detail.isEmpty
    }

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
                        todoVM.add(title: title, detail: detail, due: date)
                        isShowingCreateModal = false
                    } label: {
                        Text("save")
                            .foregroundColor(disableButtton ? .gray : .blue)
                    }
                    .disabled(disableButtton)
                }//: TOOLBARITEM
            }//: TOOLBAR        
    }//: BODY
}

//struct CreateTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTodoView()
//    }
//}
