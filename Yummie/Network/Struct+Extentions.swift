//
//  Struct+Extentions.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 21/06/21.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}

struct onBoadingSlide {
    
    var title : String
    var description : String
    var slideImage : UIImage
}
