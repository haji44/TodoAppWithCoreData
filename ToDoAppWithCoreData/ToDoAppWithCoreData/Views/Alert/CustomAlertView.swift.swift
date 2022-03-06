//
//  CustomAlertView.swift.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

enum ClickedButton {
    case ok, none
}

struct CutomAlertView: View {
    
    @Binding var shown: Bool
    @Binding var closureA: ClickedButton
    var isSuccess: Bool
    var message: String
    
    var body: some View {
        VStack {
            Image(isSuccess ? "check":"remove")
                .resizable().frame(width: 50, height: 50).padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(message)
                .foregroundColor(Color.white)
            Spacer()
            Divider()
            HStack {
                Button("Ok") {
                    closureA = .ok
                    shown.toggle()
                }//: BUTTON
                .frame(width: UIScreen.main.bounds.width/2, height: 40)
                .foregroundColor(.white)
            }//: HSTACK
        }//: VSTACK
        .frame(width: UIScreen.main.bounds.width-50, height: 200)
        .background(Color.black.opacity(0.5))
        .cornerRadius(12)
        .clipped()
    }
}
