//
//  CommandDataStoreFactory.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation

class CommandDataStoreFactory {
    
    private let cloudCommandDataStore: CloudCommandDataStore = CloudCommandDataStore()
    private let localCommandDataStore: LocalCommandDataStore = LocalCommandDataStore()
    
    func createCloudCommandDataStore() -> CommandDataStore {
        return cloudCommandDataStore
    }
    
    func createLocalCommandDataStore() -> CommandDataStore {
        return localCommandDataStore
    }
    
}
