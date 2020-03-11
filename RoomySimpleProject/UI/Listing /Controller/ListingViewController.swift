//
//  ListingViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/11/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    @IBOutlet weak var requestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestBtn.layer.cornerRadius = requestBtn.bounds.height / 2
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
