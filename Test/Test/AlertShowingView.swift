//
//  AlertShowingView.swift
//  Test
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

enum ClickedButton {
    case ok, cancel, none
}

enum InputState {
    case ok, empty, short, none
}

// ContentView
struct AlertShowingView: View {
    @State var shown = false // manage to show if alert show or not
    @State var message = "" // this used to alert message, automatically setting by button type
    @State var btn: ClickedButton = .none // detect the button taht the user tapped
    @State var isSuccess = false // detecting the image

    @State var state: InputState = .none // detect the button taht the user tapped
    @State var alert: AlertItemContext?
    @State var name: String = ""

    
    var body: some View {

        ZStack {
                VStack {
                    Image("demo")
                        .resizable().frame(width: 300, height: 300)
                        
                    VStack {
                        HStack {
                            Spacer()
                            TextField("name", text: $name)
                                .padding()
                                .background(Color.accentColor.opacity(0.2))
                            Spacer()
                        }
                        
                        Button("Input Ceck") {
                            // enumを判定して表示する
                            inputCheck()


                        }

                    }
                    Spacer()
                }.blur(radius: shown ? 30 : 0)

            if shown {
                CutomAlertView(shown: $shown, closureA: $btn, isSuccess: isSuccess, message: message)
            }

        }
    }
    
    private func inputCheck() -> InputState {
        guard name.isEmpty else {  state = .empty
            return state}
        if name.count <= 3 {
            state = .short
            return state
        } else {
            state = .ok
            return state
        }
    }
    
}

struct AlertShowingView_Previews: PreviewProvider {
    static var previews: some View {
        AlertShowingView()
    }
}
