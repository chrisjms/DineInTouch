//
//  DishRepository.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol DishRepository {
    
    func sendDishes(dishes: [Dish]) -> Single<Bool>
    func getLocalDishes() -> Single<[Dish]>
    func getCloudDishes() -> Single<[Dish]>
    func deleteLocalDish(dish: Dish) -> Single<Bool>
    func deleteCloudDish(dish: Dish) -> Single<Bool>
    func saveLocalDish(dish: Dish) -> Single<Bool>
    func saveCloudDish(dish: Dish) -> Single<Bool>

}
