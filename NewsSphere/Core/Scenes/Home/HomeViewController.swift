//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by TGG Team on 21/03/25.
//

import UIKit
import Stevia

final class HomeViewController: UIViewController {
    
    private let presenter: HomePresenter

    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Setup Subviews
extension HomeViewController {
    private func setupViews() {

    }
    
    private func setupConstraints() {

    }
}
