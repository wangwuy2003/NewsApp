//
//  CoreRouter+Navigate.swift
//  NewsSphere
//
//  Created by MacMini A6 on 23/6/25.
//
import UIKit

extension CoreRouter {
    func navigateToIntro() {
        navigate(to: builder.introView(router: self))
    }
    
    func navigateToLogin() {
        navigate(to: builder.loginView(router: self))
    }
    
    func navigateToHome() {
        navigate(to: builder.homeView(router: self))
    }
}

