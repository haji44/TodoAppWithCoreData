//
//  Date+Ext.swift
//  TodoTimer
//
//  Created by kitano hajime on 2022/03/08.
//

import Foundation

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
