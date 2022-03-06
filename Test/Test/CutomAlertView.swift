//
//  CutomAlertView.swift
//  Test
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

struct CutomAlertView: View {
    
    @Binding var shown: Bool
    @Binding var closureA: ClickedButton
    var isSuccess: Bool
    var message: String
    
    var body: some View {
        VStack {
            
            Image(systemName: isSuccess ? "checkmark.circle":"minus.circle.fill").resizable().frame(width: 50, height: 50).padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(message).foregroundColor(Color.white)
            Spacer()
            Divider()
            HStack {
//                Button("Close") {
//                    closureA = .cancel
//                    shown.toggle()
//                }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
//                .foregroundColor(.white)
//
                Button("OK") {
                    closureA = .ok
                    shown.toggle()
                }.frame(width: UIScreen.main.bounds.width/2, height: 40)
                .foregroundColor(.white)
                
            }
            
        }.frame(width: UIScreen.main.bounds.width-50, height: 200)
        
        .background(Color.black.opacity(0.5))
        .cornerRadius(12)
        .clipped()
        
    }
}

//struct CutomAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        CutomAlertView()
//    }
//}
