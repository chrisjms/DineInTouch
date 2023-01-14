//
//  Command.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation

struct Command {
    
    let commandId: String
    let tableId: Double
    let creationDate: Double
    let dishes: [String]
    
    static func dishesArrayToString(dishes: [String]) -> String {
        var dishesString = ""
        dishes.forEach { dish in
            dishesString += dish + GLOBALS.delimiter
        }
        if !dishesString.isEmpty {
            dishesString.removeLast()
        }
        return dishesString
    }
    
    static func dishesStringToDishes(dishesString: String) -> [String] {
        let stringArray = dishesString.components(separatedBy: GLOBALS.delimiter)
        return stringArray
    }
    
}
