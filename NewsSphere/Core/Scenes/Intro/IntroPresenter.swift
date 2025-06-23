//
//  IntroPresenter.swift
//  NewsSphere
//
//  Created by MacMini A6 on 23/6/25.
//
import UIKit

class IntroPresenter {
    var router: CoreRouter
    
    init(router: CoreRouter) {
        self.router = router
    }
    
    func navigateToLogin() {
        router.navigateToLogin()
    }
}
