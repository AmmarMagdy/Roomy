//
//  UIViewController+Extensions.swift
//  PostsApplication
//
//  Created by Karim Ebrahem on 4/18/20.
//  Copyright © 2020 Karim Ebrahem. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Oki", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
