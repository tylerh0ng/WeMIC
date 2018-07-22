//
//  ViewController.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/11/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class ViewController: UIViewController {
 @IBOutlet weak var pineapple: UIImageView!
   
    @IBAction func loginBTapped(_ sender: Any) {
        if Email.text==""||Password.text==""{
            let alert=UIAlertController(title: "Missing information", message: "Please provide your Stanford Email and your password!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
            
        }
        else{
            Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { (Result, Error) in
                if Error==nil{
                    self.performSegue(withIdentifier: "login", sender: sender)
                }
                else{
                    let alert=UIAlertController(title: "Login Unsuccessful", message: "Please try again or make sure you entered your correct login info", preferredStyle: .alert)
                    let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                        print(cancel)
                    }
                    alert.addAction(ok)
                    self.present(alert,animated:true,completion:nil)
                }
            }
            
            
        }
    }
    
   
   
       
    
   
    @IBOutlet weak var loginB: UIButton!
    @IBOutlet weak var treeIcon: UIImageView!
    @IBOutlet weak var Email: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var registration3: UIButton!
    @IBOutlet weak var lock: UIImageView!
    
    @IBOutlet weak var Password:SkyFloatingLabelTextField!
    
  
   
    @IBOutlet weak var LetsGetStarted: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(loginB)
        self.view.addSubview(pineapple)
        self.view.addSubview(LetsGetStarted)
       self.view.addSubview(treeIcon)
      self.view.addSubview(registration3)
        
        

        setUpEmail()
        setUpPassword()
        
        
    
       
     
       self.view.addSubview(Password)
        self.view.addSubview(Email)
        self.view.addSubview(lock)
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpPassword(){
        let textFieldFrame = CGRect(x: 71, y: 399, width: 288, height: 60)
        Password.placeholder="Your Password"
        Password.title="Your Password"
        Password.frame=textFieldFrame
      Password.textColor=UIColor.white
        Password.lineColor=UIColor.white
        Password.selectedTitleColor=UIColor.white
        Password.selectedLineColor=UIColor.white
       Password.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        Password.tintColor=UIColor.white
        Password.lineHeight=1
        Password.selectedLineHeight=1
       Password.placeholderColor=UIColor.white
        
    }
    
   
   
    
    func setUpEmail(){
        let textFieldFrame = CGRect(x: 71, y: 302, width: 288, height: 60)
        Email.placeholder="Stanford Email"
        Email.frame=textFieldFrame
        Email.title="Your Stanford email"
        Email.textColor=UIColor.white
        Email.lineColor=UIColor.white
        Email.lineHeight=1
        
        Email.selectedLineHeight=1
        Email.selectedTitleColor=UIColor.white
        Email.selectedLineColor=UIColor.white
        Email.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        Email.tintColor=UIColor.white
        Email.placeholderColor=UIColor.white
        
    }
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

