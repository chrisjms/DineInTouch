//
//  DishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol DishDataStore {
    
    func saveDish()
    func getDishes() -> Single<[Dish]>
    func getLocalDishes() -> [Dish]
    func deleteDish()
    func deleteLocalDish()
    func insertDish(dish: Dish) -> Single<Bool>
    func insertLocalDish(dish: Dish) -> Bool
}
