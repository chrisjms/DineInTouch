//
//  DishManagerProtocol.swift
//  DineInTouch
//
//  Created by Chris on 22/01/2023.
//

import Foundation
import RxSwift

protocol DishManagerProtocol {
    
    func sendDishes(dishes: [Dish]) -> Single<Bool>
    func getDishes(dishes: [Dish]) -> Single<[Dish]>
    
}
