//
//  ItemButton.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemButton: View {
    
    var color: Color
    var title: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 60)
                .foregroundColor(.green)
                .padding(.horizontal, 10)
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct ItemButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemButton(color: .green, title: "test button")
    }
}
