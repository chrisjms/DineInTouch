//
//  CloudCommandDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CloudCommandDataStore: CommandDataStore {
    
    func deleteCommand(command: Command) -> Single<Bool> {
        DataProviderManager.shared.deleteCommand(command: command)
    }
    
    func deleteLocalCommand(command: Command) {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAllLocalCommands() {
        fatalError("Operation is not available !!!")
    }
    
    func saveCommand(command: Command) {
        fatalError("Operation is not available !!!")
    }
    
    func getCommands() -> Single<[Command]> {
        DataProviderManager.shared.getAllCommands()
    }
    
    func getLocalCommands() -> Single<[Command]> {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAll() {
        DataProviderManager.shared.deleteAllCommands()
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        DataProviderManager.shared.insertCommand(command: command)
    }
    
}
