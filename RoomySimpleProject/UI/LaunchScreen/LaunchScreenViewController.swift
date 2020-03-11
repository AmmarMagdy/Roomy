//
//  LaunchScreenViewController.swift
//  BeCare
//
//  Created by Afnan on 7/10/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import DCAnimationKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = #imageLiteral(resourceName: "Roomy")
        logoImageView.tada(nil)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
    }
    
    @objc func splashTimeOut(sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: LandingViewController())
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
}
