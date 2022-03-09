//
//  TimerView.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/08.
//

import SwiftUI

struct TimerView: View {

    @State var nowDate: Date = Date()
    let referenceDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }

    var body: some View {
        Text(updateCurrentTime())
            .font(.largeTitle)
            .onAppear(perform: {
                _ = self.timer
            })
    }

    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dd:%02dh:%02dm:%02ds",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }

    func updateCurrentTime() -> String {
        var remainingTime: TimeInterval = 0
        remainingTime = referenceDate - nowDate

        let days: Int = Int(remainingTime / 2400 )
        let minus: Int = Int(remainingTime / 60 )
        let seconds: Int = Int(remainingTime / 60)
        let milliseconds = Int(remainingTime * 100)

        return String(format: "%02d:%02d,%02d", days, seconds, milliseconds)
    }

}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
