//
//  BottomPaddedTextField.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/11/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class BottomPaddedTextField: SkyFloatingLabelTextField {
 
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x, y: bounds.origin.y+10, width: bounds.width, height: bounds.height)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
