//
//  SetMenuViewModel.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class SetMenuViewModel: ObservableObject {
    
    let disposeBag: DisposeBag = DisposeBag()

    @Published var goToCommandView: Bool = false
    @Published var appetizer: String = ""
    @Published var appetizerPrice: String = ""
    @Published var starterPrice: String = ""
    @Published var starter: String = ""
    @Published var dishPrice: String = ""
    @Published var dish: String = ""
    @Published var dessertPrice: String = ""
    @Published var dessert: String = ""

    @Published var dishesList: [Dish] = []
    @Published var showAlert: Bool = false

    @Published var tag: Int = 1
    
    func createDish(dishType: Dish.DishType) {
        switch dishType {
        case .appetizer:
            guard !appetizer.isEmpty && !appetizerPrice.isEmpty else {
                showAlert.toggle()
                return
            }
            let dish = Dish(dishId: UUID().uuidString, type: dishType, name: self.appetizer, price: Double(self.appetizerPrice)!)
            dishesList.append(dish)
            self.appetizer = ""
            self.appetizerPrice = ""
        case .starter:
            guard !starter.isEmpty && !starterPrice.isEmpty else {
                showAlert.toggle()
                return
            }
            let dish = Dish(dishId: UUID().uuidString, type: dishType, name: self.starter, price: Double(self.starterPrice)!)
            dishesList.append(dish)
            self.starter = ""
            self.starterPrice = ""
        case .dish:
            guard !dish.isEmpty && !dishPrice.isEmpty else {
                showAlert.toggle()
                return
            }
            let dish = Dish(dishId: UUID().uuidString, type: dishType, name: self.dish, price: Double(self.dishPrice)!)
            dishesList.append(dish)
            self.dish = ""
            self.dishPrice = ""
        case .dessert:
            guard !dessert.isEmpty && !dessertPrice.isEmpty else {
                showAlert.toggle()
                return
            }
            let dish = Dish(dishId: UUID().uuidString, type: dishType, name: self.dessert, price: Double(self.dessertPrice)!)
            dishesList.append(dish)
            self.dessert = ""
            self.dessertPrice = ""
        case .drink:
            print("not available")
        }
    }

    func sendMenu() {
        DataProviderManager.shared.insertDishes(dishes: dishesList)
            .subscribe(onSuccess: { success in
                print("successfully added menu")
                DineInTouchKeyManager.shared.saveString(key: "connected", value: "true")
                self.goToCommandView.toggle()
            }, onFailure: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
}
