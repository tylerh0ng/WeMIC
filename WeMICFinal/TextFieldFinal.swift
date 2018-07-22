//
//  TextFieldFinal.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/11/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class TextFieldFinal: SkyFloatingLabelTextField {
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, 0, 15, 0))
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
