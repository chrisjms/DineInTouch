//
//  DishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol DishDataStore {
    
    func saveDish(dish: Dish)
    func getDishes() -> Single<[Dish]>
    func getLocalDishes() -> Single<[Dish]>
    func deleteDish(dish: Dish)
    func deleteLocalDish(dish: Dish)
    func insertDish(dish: Dish) -> Single<Bool>
    func insertDishes(dishes: [Dish]) -> Single<Bool>
    func saveAllDishes(dishes: [Dish])
    
}
