//
//  LaunchScreenViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2019 Ammar.M All rights reserved.
//

import DCAnimationKit
import KeychainSwift

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimationLogo()
    }
}

extension LaunchScreenViewController {
    private func setupAnimationLogo() {
        logoImageView.image = #imageLiteral(resourceName: "Roomy")
        logoImageView.tada(nil)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
    }
}

extension LaunchScreenViewController {
    @objc private func splashTimeOut(sender: UIButton) {
        if KeychainSwift().get("auth_token") == nil {
            let navigationController = UINavigationController(rootViewController: LandingViewController())
            navigationController.isNavigationBarHidden = true
            UIApplication.shared.keyWindow?.rootViewController = navigationController
        } else {
            let navigationController = UINavigationController(rootViewController: HomeViewController())
            navigationController.isNavigationBarHidden = true
            UIApplication.shared.keyWindow?.rootViewController = navigationController
        }
    }
}
