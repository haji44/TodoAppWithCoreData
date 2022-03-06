//
//  FormView.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/26.
//

import SwiftUI

struct FormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var focusedTextField: FromTextField? // suggest the filed required to input for a user
    
    @State private var name: String = ""
    @State private var detail: String = ""
    @State var date = Date.now
    @State private var dueDate: String = ""
    
    // this enum case represents field of view
    enum FromTextField {
        case title, detail
    }
    
    var body: some View {
        Form {
            Section(header: Text("New Task")) {
                TextField("What's your task?", text: $name)
                    .focused($focusedTextField, equals: .title)
                    .onSubmit { focusedTextField = .detail } // set next field
                    .submitLabel(.next) // cofigure the keyboard button text
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))

                TextField("How to resolve?", text: $detail)
                    .focused($focusedTextField, equals: .detail)
                    .onSubmit { focusedTextField = nil } // dismiss keybord
                    .keyboardType(.asciiCapable)
                    .disableAutocorrection(true)
                    .frame(height: 150)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))
            }//: SECTION TASK
            
            Section(header: Text("Due")) {
                DatePicker(selection: $date) {
                    Text("Due")
                }
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
            }
        }//: FORM
    }//: BODY
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
