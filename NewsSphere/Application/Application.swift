//
//  Application.swift
//  NewsSphere
//
//  Created by MacMini A6 on 23/6/25.
//

import UIKit

class Application {
    
    static let shared = Application()
    @MainActor
//    let purchaseManager = ManagerProvider.shared.makePurchaseManager()
    private var transacitonListener: Task<Bool, Error>?

    private var isFirstTimeLaunch: Bool {
        let defaults = UserDefaults.standard
        let wasFirstTime = defaults.bool(forKey: Constants.firstTimeLaunchApp)
        return !wasFirstTime
    }
    
    private func markFirstTimeLaunched() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Constants.firstTimeLaunchApp)
    }
    
    private init() {
//        configRealmDatabase()
//        Task {
//            await handleIAPTransaction()
//        }
    }
}

// MARK: - Config main interface
extension Application {
    private var hasCompletedOnboarding: Bool {
        UserDefaults.standard.bool(forKey: Constants.hasCompletedOnboarding)
    }
    
    func markOnboardingCompleted() {
        UserDefaults.standard.set(true, forKey: Constants.hasCompletedOnboarding)
    }
    
    func configMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        let builder = CoreBuilder()
        let router = CoreRouter(navigationController: navigationController, builder: builder)

        if isFirstTimeLaunch {
            navigationController.setViewControllers([builder.splashView(router: router)],
                                                    animated: false)
            markFirstTimeLaunched()
        } else if !hasCompletedOnboarding {
            navigationController.setViewControllers([builder.introView(router: router)],
                                                    animated: false)
        } else {
            navigationController.setViewControllers([builder.loginView(router: router)],
                                                    animated: false)
        }
        
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - Config realm database
extension Application {
//    private func configRealmDatabase() {
//        let config = Realm.Configuration(
//            // Set the new schema version. This must be greater than the previously used
//            schemaVersion: 0,
//            // Set the block which will be called automatically when opening a Realm
//            migrationBlock: { _, oldSchemaVersion in
//                // We haven’t migrated anything yet, so oldSchemaVersion == 0
//                if oldSchemaVersion < 1 {
//                    // Realm will automatically detect new properties and removed properties
//                    // And will update the schema on disk automatically
//                }
//            })
//        Realm.Configuration.defaultConfiguration = config
//    }
}

// MARK: - Handle iap transaction
extension Application {
//    private func handleIAPTransaction() async {
//        Task {
//            await purchaseManager.updatePurchasedProducts()
//            
//            await debugPrint(purchaseManager.entitlementManager.hasPro)
//        }
//    }
//
//    @MainActor
//    var hasUnlockedPro: Bool {
//        return purchaseManager.entitlementManager.hasPro
//    }
}
