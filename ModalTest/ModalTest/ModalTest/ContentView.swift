//
//  ContentView.swift
//  ModalTest
//
//  Created by kitano hajime on 2022/03/02.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingModal: Bool = false
    
    var body: some View {
        VStack {
            Text("親View")
                .padding(.bottom, 200)
            
            Button {
                isShowingModal = true
            } label: {
                Text("遷移するよ")
                    .tint(.blue)
            }
        }
        .sheet(isPresented: $isShowingModal) {
            ModalView(isShowingModal: $isShowingModal)
        }
    }
}

struct ModalView: View {
    @Binding var isShowingModal: Bool
    var body: some View {
        NavigationView {
            Text("遷移したよ")
                .navigationBarItems(trailing:
                                        Button(action: {
                    isShowingModal = false
                }, label: {
                    Text("Done")
                        .tint(.blue)
                })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
