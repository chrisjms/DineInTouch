//
//  LocalCommandDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class LocalCommandDataStore: CommandDataStore {
    
    func saveCommand(command: Command) {
        fatalError("Operation is not  !!!")
    }
    
    func getCommands() -> Single<[Command]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalCommands() -> [Command] {
        fatalError("Operation is not  !!!")
    }
    
    func deleteAll() {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAllLocalCommands() {
        fatalError("Operation is not  !!!")
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    
}
