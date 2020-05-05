//
//  LoginViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import KeychainSwift

class LoginViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet var socialViews: [CustomView]!
    
    private var loginAPI: AuthAPI!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    @IBAction func goToHomePage(_ sender: Any) {
        login()
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
extension LoginViewController {
    private func login() {
        if !emailTextField.text!.isEmpty &&
            !passwordTextField.text!.isEmpty {
            startAnimating()
            Request.requestAPI(router: Router.login(emailTextField.text!, passwordTextField.text!)) { [unowned self](response, _) in
                self.stopAnimating()
                switch response {
                case .success(let result):
                    do {
                        self.loginAPI = try JSONDecoder().decode(AuthAPI.self, from: result)
                        if let _ = self.loginAPI.authToken {
                            KeychainSwift().set(self.loginAPI.authToken!, forKey: "auth_token")
                        }
                        self.navigationController?.pushViewController(HomeViewController(), animated: true)
                    } catch let error {
                        // Can't parse posts
                        print(error)
                    }
                case.failure(let error):
                    self.showAlert(title: "Error", message: error.localizedDescription)
                    
                }
            }
        }
        
    }
}
