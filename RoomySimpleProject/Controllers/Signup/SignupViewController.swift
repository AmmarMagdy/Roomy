//
//  SignupViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 4/29/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import KeychainSwift

class SignupViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet var socialViews: [CustomView]!
    
    private var signupAPI: AuthAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    @IBAction func goToHomePage(_ sender: Any) {
        signup()
    }
    
    @IBAction func goToSigninPage(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}

extension SignupViewController {
    
    private func setupView() {
        for socialView in socialViews {
            let width = socialView.bounds.width < socialView.bounds.height ? socialView.bounds.width : socialView.bounds.height
            socialView.frame.size = CGSize(width: width, height: width)
            socialView.layer.cornerRadius = socialView.bounds.width / 2
        }
        signupBtn.layer.cornerRadius = signupBtn.bounds.height / 2
    }
}
extension SignupViewController {
    private func signup() {
        if !nameTextField.text!.isEmpty &&
            !emailTextField.text!.isEmpty &&
            !passwordTextField.text!.isEmpty  {
            startAnimating()
            Request.requestAPI(router: Router.signup(nameTextField.text!, emailTextField.text!, passwordTextField.text!)) { [unowned self](response, _) in
                self.stopAnimating()
                switch response {
                case .success(let result):
                    do {
                        self.signupAPI = try JSONDecoder().decode(AuthAPI.self, from: result)
                        if let _ = self.signupAPI.authToken {
                            KeychainSwift().set(self.signupAPI.authToken!, forKey: "auth_token")
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
