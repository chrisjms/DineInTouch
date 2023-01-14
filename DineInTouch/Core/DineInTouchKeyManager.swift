//
//  DineInTouchKeyManager.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import KeychainAccess

internal class SharePaKeyManager {
    
    private var keychain = Keychain(service: "com.chriisjms.DineInTouch")
    
    public static let shared: SharePaKeyManager = {
        return SharePaKeyManager()
    }()
    
    private init(){}
    
    /// Save a string to the Keychain
    ///
    /// - Parameter key: The key for the Keychain item
    /// - Parameter value: The value for that key
    /// - Returns: Whether the save succeeded or not
    func saveString(key: String!, value: String!) {
        do {
            try keychain.set(value, key: key)
        } catch {
            print("Error saving into keychain")
            return
        }
    }
    
    /// Retrieve a string from the Keychain. Will return nil if not found.
    ///
    /// - Parameter key: The key for the Keychain item
    /// - Returns: The value for that key
    func getString(key: String!, defaultValue: String?) -> String? {
        if contains(key: key) {
            return keychain[key]
        } else {
            return defaultValue
        }
    }
    
    /// Whether the Keychain contains a specific key
    ///
    /// - Parameter key: The key for the Keychain item
    /// - Returns: Whether the Keychain contains that key
    func contains(key: String!) -> Bool! {
        do {
            return try keychain.contains(key)
        } catch {
            return false
        }
    }
    
    /// Remove a Keychain item
    ///
    /// - Parameter key: The key for the Keychain item
    /// - Returns: Whether the removal succeeded or not
    func remove(key: String!) {
        do {
            try keychain.remove(key)
        } catch {
            print("Error removing key")
            return
        }
        print("Key saved in keychain")
        return
    }
    
    func removeAll() {
        do {
            print("SharePaKeyManager was cleaned")
            try keychain.removeAll()
        } catch {
            print("Error removing all keychain")
            return
        }
        print("keychain removed")
        return
    }
}
