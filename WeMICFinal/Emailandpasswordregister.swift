//
//  Emailandpasswordregister.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/12/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import FirebaseAuth
class Emailandpasswordregister: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setUpGradient(){
        let topColor=UIColor(red: 255/255, green: 149/255, blue: 56/255, alpha: 1)
        let bottomColor=UIColor(red: 216/255, green: 57/255, blue: 177/255, alpha: 1)
        let gradientColors: [CGColor]=[topColor.cgColor,bottomColor.cgColor]
        var gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors=gradientColors
        gradientLayer.startPoint=CGPoint(x: 0, y:0)
        gradientLayer.endPoint=CGPoint(x: 0, y:1)
        self.view.layer.addSublayer(gradientLayer)
    }

}
