//
//  Date+Ext.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/26.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    var hundreadYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
    
}
