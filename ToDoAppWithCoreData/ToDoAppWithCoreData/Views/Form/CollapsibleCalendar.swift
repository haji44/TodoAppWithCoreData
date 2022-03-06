//
//  CollapsibleCalendar.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    var label: () -> Text
    var content: () -> Content
    
    @State var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: collapsed)
            .transition(.slide)
        }
    }
}
