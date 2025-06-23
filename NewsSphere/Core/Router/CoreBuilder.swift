//
//  CoreBuilder.swift
//  NewsSphere
//
//  Created by MacMini A6 on 23/6/25.
//
import UIKit

struct CoreBuilder {
    func splashView(router: CoreRouter) -> SplashViewController {
        let presenter = SplashPresenter(router: router)
        
        return SplashViewController(presenter: presenter)
    }
    
    func introView(router: CoreRouter) -> IntroViewController {
        let presenter = IntroPresenter(router: router)
        
        return IntroViewController(presenter: presenter)
    }
    
    func loginView(router: CoreRouter) -> LoginViewController {
        let presenter = LoginPresenter(router: router)
        return LoginViewController(presenter: presenter)
    }
    
    func homeView(router: CoreRouter) -> HomeViewController {
        let presenter = HomePresenter(router: router)
        return HomeViewController(presenter: presenter)
    }
}
