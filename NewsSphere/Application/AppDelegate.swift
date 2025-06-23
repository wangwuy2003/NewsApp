//
//  AppDelegate.swift
//  NewsSphere
//
//  Created by MacMini A6 on 20/6/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = self.window ?? UIWindow()
        
        self.window = window
        Application.shared.configMainInterface(in: window)
        return true
    }
    
    func configRoot() {
        
    }
}

