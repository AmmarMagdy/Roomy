//
//  RoomDetailsViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/11/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController {
    
    @IBOutlet weak var requestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          setupView()
      }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension RoomDetailsViewController {
    private func setupView() {
        requestBtn.layer.cornerRadius = requestBtn.bounds.height / 2
    }
}
