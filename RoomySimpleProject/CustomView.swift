//
//  CustomView.swift
//  Happy Days
//
//  Created by Afnan on 7/16/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
     @IBInspectable var isCircle: Bool = false {
         didSet {
            let width = bounds.width < bounds.height ? bounds.width : bounds.height
            self.frame.size = CGSize(width: width, height: width)
            self.layer.cornerRadius = self.bounds.width / 2
         }
     }

    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            if isCircle {
                layer.shadowRadius = self.bounds.width / 2
            } else {
                layer.shadowRadius = newValue
            }
        }
    }

    
    @IBInspectable
    var shadowPath: CGPath? {
          get {
              return layer.shadowPath
          }
          set {
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
          }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

