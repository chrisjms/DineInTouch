//
//  LocalDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class LocalDishDataStore: DishDataStore {
    
    func insertLocalDish(dish: Dish) -> Bool {
        <#code#>
    }
    
    
    func saveDish() {
        <#code#>
    }
    
    func getDishes() -> Single<[Dish]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalDishes() -> [Dish] {
        <#code#>
    }
    
    func deleteDish() {
        fatalError("Operation is not available !!!")
    }
    
    func deleteLocalDish() {
        <#code#>
    }
    
    func insertDish(dish: Dish) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    
}
