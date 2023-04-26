//
//  UIViewExtension.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import Foundation
import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat{
       get {return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
