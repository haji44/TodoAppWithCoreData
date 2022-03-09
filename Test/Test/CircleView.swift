//
//  CircleView.swift
//  Test
//
//  Created by kitano hajime on 2022/03/09.
//

import SwiftUI

//struct AnimationWithCircle: View {
//    var isDone: Bool
//    @State private var animation: Double = 0.0
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(isDone ? .green : .clear)
//                .frame(width: 25, height: 25, alignment: .center)
//            Circle()
//                .stroke(.green, lineWidth: 2)
//                .frame(width: 30, height: 30, alignment: .center)
//                .scaleEffect( 1 + CGFloat(animation))
//                .opacity( 1 - animation)
//        }
//        .onAppear {
//            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
//                animation = 1
//            }
//        }
//    }
//}

//struct CircleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleView(flag: false)
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//        CircleView(flag: true)
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//    }
//}
