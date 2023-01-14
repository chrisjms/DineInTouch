//
//  CommandDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol CommandDataStore {
    
    func saveCommand(command: Command)
    func getCommands() -> Single<[Command]>
    func getLocalCommands() -> Single<[Command]>
    func deleteAll()
    func deleteAllLocalCommands()
    func sendCommand(command: Command) -> Single<Bool>
    
}
