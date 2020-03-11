//
//  LandingViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func goToSigninPage(_ sender: Any) {
        self.navigationController?.pushViewController(SigninViewController(), animated: true)
    }
    
}
