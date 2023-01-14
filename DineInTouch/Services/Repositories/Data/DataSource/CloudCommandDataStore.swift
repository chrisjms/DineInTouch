//
//  CloudCommandDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CloudCommandDataStore: CommandDataStore {
    
    func deleteAllLocalCommands() {
        fatalError("Operation is not available !!!")
    }
    
    func saveCommand(command: Command) {
        fatalError("Operation is not available !!!")
    }
    
    func getCommands() -> Single<[Command]> {
        fatalError("Operation is not  !!!")

    }
    
    func getLocalCommands() -> [Command] {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAll() {
        fatalError("Operation is not  !!!")
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        fatalError("Operation is not  !!!")
    }
    
}
