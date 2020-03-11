//
//  SigninViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var googleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signinBtn.layer.cornerRadius = signinBtn.bounds.height / 2

    }

    @IBAction func goToHomePage(_ sender: Any) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    

}
