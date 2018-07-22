//
//  1ststepregViewController.swift
//  
//
//  Created by Tasha Mallow on 7/12/18.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth
import Firebase
class _ststepregViewController: UIViewController {

   
   
  
    @IBAction func userPressedNext(_ sender: Any) {
        let attemptedEmail=emailField.text!
        let idx=attemptedEmail.characters.index(of: "@")
        let emailDomain=attemptedEmail.suffix(from: idx!)
        if confirmPasswordField.text == ""||passwordField.text == ""||confirmPasswordField.text == ""{
            let alert=UIAlertController(title: "Missing information", message: "Please make sure that you typed in a value for all fields above.", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
        }
        else if passwordField.text != confirmPasswordField.text!{
            let alert=UIAlertController(title: "Passwords do not match", message: "Please make sure that you typed the same password in both password fields", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
        }
        else if emailDomain != "@stanford.edu"{
            let alert=UIAlertController(title: "Not a Stanford email", message: "Please be sure you sign up using a Stanford email", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
            
        }
        else{
            Auth.auth().createUser(withEmail: attemptedEmail, password: passwordField.text!) { (User, Error) in
                if Error != nil{
                    let alert=UIAlertController(title: "Sign up failed.", message: "Please try again", preferredStyle: .alert)
                    let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                        print(cancel)
                    }
                    alert.addAction(ok)
                    self.present(alert,animated:true,completion:nil)
                }
                else{
                    Auth.auth().signIn(withEmail: attemptedEmail, password: self.passwordField.text!, completion: { (User, Error) in
                        if Error==nil{
                            print("success")
                        }
                    })
                    Auth.auth().currentUser!.sendEmailVerification(completion: { (Error) in
                        if Error==nil{
                            self.performSegue(withIdentifier: "goToVerification", sender: sender)
                        }
                    })
                }
            }
            
        }
    }
    @IBOutlet weak var goToSecond: UIButton!
    @IBOutlet weak var header: UITextView!
    @IBOutlet weak var confirmPasswordField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailField: SkyFloatingLabelTextField!
    @IBOutlet weak var pineapple: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        header.backgroundColor=UIColor.clear
        header.textColor=UIColor.white
        self.view.addSubview(pineapple)
      self.view.addSubview(header)
        self.view.addSubview(confirmPasswordField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(goToSecond)
        setUpEmail()
        setUpPassword()
        reconfirmPassword()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpEmail(){
        
            let textFieldFrame = CGRect(x: 38, y: 278, width: 300, height: 60)
           emailField.placeholder="Stanford Email"
           emailField.frame=textFieldFrame
            emailField.title="Your Stanford email"
            emailField.textColor=UIColor.white
            emailField.lineColor=UIColor.white
            emailField.lineHeight=1
            
           emailField.selectedLineHeight=1
           emailField.selectedTitleColor=UIColor.white
            emailField.selectedLineColor=UIColor.white
            emailField.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
            emailField.tintColor=UIColor.white
            emailField.placeholderColor=UIColor.white
            
        
    }
    func setUpPassword(){
        let textFieldFrame = CGRect(x: 38, y: 352, width: 300, height: 60)
        passwordField.placeholder="Choose a Password"
        passwordField.frame=textFieldFrame
        passwordField.title="Your Password"
        passwordField.textColor=UIColor.white
        passwordField.lineColor=UIColor.white
        passwordField.lineHeight=1
        
        passwordField.selectedLineHeight=1
        passwordField.selectedTitleColor=UIColor.white
        passwordField.selectedLineColor=UIColor.white
        passwordField.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        passwordField.tintColor=UIColor.white
        passwordField.placeholderColor=UIColor.white
    }
    func reconfirmPassword(){
        let textFieldFrame = CGRect(x: 38, y: 426, width: 300, height: 60)
        confirmPasswordField.placeholder="Reconfirm Password"
        confirmPasswordField.frame=textFieldFrame
        confirmPasswordField.title="Your Password"
        confirmPasswordField.textColor=UIColor.white
        confirmPasswordField.lineColor=UIColor.white
        confirmPasswordField.lineHeight=1
        
        confirmPasswordField.selectedLineHeight=1
        confirmPasswordField.selectedTitleColor=UIColor.white
        confirmPasswordField.selectedLineColor=UIColor.white
        confirmPasswordField.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        confirmPasswordField.tintColor=UIColor.white
        confirmPasswordField.placeholderColor=UIColor.white
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
