//
//  SplashViewController.swift
//  NewsSphere
//
//  Created by MacMini A6 on 20/6/25.
//

import UIKit

class SplashViewController: UIViewController {
    private let presenter: SplashPresenter
    
    init(presenter: SplashPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension SplashViewController {
    private func setupView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.presenter.navigateToIntro()
        }
    }
    
    private func showLoadingIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func hideLoadingIndicator() {
        view.subviews
            .filter { $0 is UIActivityIndicatorView }
            .forEach { $0.removeFromSuperview() }
    }
}
