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
        <#code#>
    }
    
    func getCommands() -> Single<[Command]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalCommands() -> [Command] {
        <#code#>
    }
    
    func deleteAll() {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAllLocalCommands() {
        <#code#>
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    
}
