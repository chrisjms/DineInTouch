//
//  Dish.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation

struct Dish: Hashable {
    
    let dishId: String
    let type: DishType
    let name: String
    let price: Double
    
    //todo add cuisson for meat?
    enum DishType {
        case starter
        case drink
        case dish
        case dessert
        case appetizer
        
        func getLocalizedKey() -> String {
            switch self {
            case .starter:
                return "starter"
            case .drink:
                return "drink"
            case .appetizer:
                return "appetizer"
            case .dessert:
                return "dessert"
            case .dish:
                return "dish"
            }
        }
        
        static func fromString(dishTypeString: String) -> DishType {
            switch dishTypeString {
            case "drink":
                return .drink
            case "appetizer":
                return .appetizer
            case "dessert":
                return .dessert
            case "dish":
                return .dish
            default:
                return .starter
            }
        }
    }
    
}
