//
//  Finaledited.swift
//  
//
//  Created by Tasha Mallow on 7/12/18.
//

import UIKit
import SkyFloatingLabelTextField
class Finaledited: SkyFloatingLabelTextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        }
    func textFieldDidEndEditing() {
        self.selectedTitleColor=UIColor.white
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
