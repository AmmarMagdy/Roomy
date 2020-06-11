//
//  LoginViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet var socialViews: [CustomView]!
    
    var loginPresenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter = LoginPresenterImpl(view: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    
    @IBAction func goToHomePage(_ sender: UIButton) {
        self.startAnimating()
        loginPresenter?.login(emailTextField.text!, passwordTextField.text!)
    }
    
    @IBAction func goToSignupPage(_ sender: Any) {
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
}

extension LoginViewController {
    private func setupView() {
        for socialView in socialViews {
            socialView.layer.cornerRadius = socialView.bounds.height / 2
        }
        signinBtn.layer.cornerRadius = signinBtn.bounds.height / 2
    }
}

//extension LoginViewController {
//    private func login() {
//      
//}

extension LoginViewController: LoginView {
    func navigateToHome() {
        self.stopAnimating()
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
