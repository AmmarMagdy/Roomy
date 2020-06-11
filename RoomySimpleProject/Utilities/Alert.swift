//
//  Alert.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 6/11/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class Alert {
    
    static let shared = Alert()
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Oki", style: .default, handler: nil)
        alert.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
