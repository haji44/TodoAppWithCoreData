//
//  ItemCell.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemCell: View {
    
    var title: String
    var description: String
    
    var body: some View {
        HStack() {
            VStack(spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.body)
                    .minimumScaleFactor(0.75)
                    .lineLimit(4)
            }            
            Spacer()
        }
    }
}

//
//struct ItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCell(item: )
//    }
//}
//


