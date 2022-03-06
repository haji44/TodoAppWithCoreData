//
//  ListView.swift
//  Test
//
//  Created by kitano hajime on 2022/02/27.
//

import SwiftUI

struct ListView: View {
    
    @State var date = Date()
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Here we have some fancy text content. Could be whatever you imagine.")
                Spacer()
            }
            .padding(.bottom)
            
            Divider()
                .padding(.bottom)
            
            Form {
                Section {
                    Collapsible(
                        label: { Text("Collapsible") },
                        content: {
                            DatePicker(selection: $date) {
                                Text("text")
                            }
                            .datePickerStyle(CompactDatePickerStyle())
                        }
                    )
                        .frame(maxWidth: .infinity)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
