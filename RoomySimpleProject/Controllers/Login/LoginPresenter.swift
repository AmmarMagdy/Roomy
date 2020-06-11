//
//  LoginPresenter.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 6/6/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation
import KeychainSwift

protocol LoginView: AnyObject {
    func navigateToHome()
}

protocol LoginPresenter {
    func login(_ email: String, _ password: String)
}

class LoginPresenterImpl: LoginPresenter {
    
    weak var view: LoginView?
    var loginAPI: AuthAPI!

    init(view: LoginView) {
        self.view = view
    }
    
    func login(_ email: String, _ password: String) {
        if !email.isEmpty && !password.isEmpty {
            
            Request.requestAPI(router: Router.login(email, password)) { [unowned self](response, _) in
                switch response {
                case .success(let result):
                    do {
                        self.loginAPI = try JSONDecoder().decode(AuthAPI.self, from: result)
                        if let _ = self.loginAPI.authToken {
                            KeychainSwift().set(self.loginAPI.authToken!, forKey: "auth_token")
                        }
                        self.view?.navigateToHome()
                    } catch let error {
                        // Can't parse posts
                        print(error)
                    }
                case.failure(let error):
                    print(error)
                    Alert.shared.showAlert(title: "Error", message: error.localizedDescription)
                }
            }
        }
    }
}

