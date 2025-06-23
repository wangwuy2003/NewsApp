//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by TGG Team on 21/03/25.
//

import UIKit
import Stevia

final class LoginViewController: UIViewController {
    @IBOutlet weak var mainLB: UILabel!
    @IBOutlet weak var subLB: UILabel!
    @IBOutlet weak var forgotPasswordLB: UILabel!
    @IBOutlet weak var orLB: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let presenter: LoginPresenter

    init(presenter: LoginPresenter) {
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
extension LoginViewController {
    private func setupViews() {
        mainLB.style {
            $0.text = Localized.Login.welcomeBack
            $0.font = AppFont.SFPro.roundedBold(size: 24)
        }
        
        subLB.style {
            $0.text = Localized.Login.title
            $0.font = AppFont.SFPro.roundedRegular(size: 16)
        }
        
        emailTF.style {
            $0.placeholder = Localized.Login.email
            $0.keyboardType = .emailAddress
            $0.font = AppFont.SFPro.roundedMedium(size: 16)
        }
        
        passwordTF.style {
            $0.placeholder = Localized.Login.password
            $0.font = AppFont.SFPro.roundedMedium(size: 16)
        }
        
        forgotPasswordLB.style {
            $0.text = Localized.Login.forgotPassword
            $0.font = AppFont.SFPro.roundedMedium(size: 16)
        }
        
        orLB.style {
            $0.text = Localized.Login.or
            $0.font = AppFont.SFPro.roundedMedium(size: 16)
        }
    }
    
    private func setupConstraints() {

    }
}
