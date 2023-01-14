//
//  DishDataMapper.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import CoreData

class DishDataMapper {
    
    static func dbDishToDish(_ dishDB: DBDish) -> Dish {
        return Dish(dishId: dishDB.dishId!, type: Dish.DishType.fromString(dishTypeString: dishDB.dishType!), name: dishDB.name!, price: dishDB.price)
    }
    
    static func dishToDbDish(_ dish: Dish, inContext context: NSManagedObjectContext) -> DBDish {
        let dishDB = DBDish(context: context)
        dishDB.price = dish.price
        dishDB.name = dish.name
        dishDB.dishId = dish.dishId
        dishDB.dishType = dish.type.getLocalizedKey()
        return dishDB
    }
    
}
