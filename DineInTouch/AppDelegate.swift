//
//  AppDelegate.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import UIKit
import SwiftUI
import FirebaseCore

@main
struct launchView: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
//            if DineInTouchKeyManager.shared.getString(key: "connected", defaultValue: "")!.isEmpty {
//                SetMenuView(viewModel: SetMenuViewModel())
//            } else {
//                if DineInTouchKeyManager.shared.getString(key: "connected", defaultValue: "")! == "true" {
//                    CommandView()
//                }
//            }
            LoginView(viewModel: LoginViewModel())
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}
