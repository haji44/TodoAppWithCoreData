//
//  Alert.swift
//  ToDoAppWithCoreData
//
//  Created by kitano hajime on 2022/02/27.
//

import Foundation

struct Alert {
    let title: String
    let message: String
    let action: String
}


struct AlertItem {
    static let invalidInput = Alert(title: "Oops, empty field exists",
                                    message: "Make sure to input",
                                    action: "OK")
}


enum TodoError {
    case invalidInput
}
