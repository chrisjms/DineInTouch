//
//  CloudDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CloudDishDataStore: DishDataStore {
    
    func saveDish(dish: Dish) {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalDishes() -> Single<[Dish]> {
        fatalError("Operation is not available !!!")
    }
    
    
    func insertDish(dish: Dish) -> Single<Bool> {
        fatalError("Operation is not  !!!")
    }
    
    func insertLocalDish(dish: Dish) -> Bool {
        fatalError("Operation is not available !!!")
    }
    
    func getDishes() -> Single<[Dish]> {
        fatalError("Operation is not  !!!")
    }

    func deleteDish() {
        fatalError("Operation is not  !!!")
    }
    
    func deleteLocalDish(dish: Dish) {
        fatalError("Operation is not available !!!")
    }
    
}
