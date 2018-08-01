//
//  nameRegister.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/14/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SkyFloatingLabelTextField
class nameRegister: UIViewController {

    @IBAction func nextButtonTapped(_ sender: Any) {
        let currentUser=Auth.auth().currentUser!
        let myDatabase=Database.database().reference()
        myDatabase.child("Users").child(currentUser.uid).child("User's full name").setValue(firstName.text!+" "+lastName.text!)
        performSegue(withIdentifier: "majorAndYear", sender: sender)
        
        
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var disclaimer: UITextView!
    @IBOutlet weak var whatsYoName: UITextView!
    @IBOutlet weak var pineapple: UIImageView!
    @IBOutlet weak var lastName: SkyFloatingLabelTextField!
    @IBOutlet weak var firstName: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(disclaimer)
        self.view.addSubview(whatsYoName)
        self.view.addSubview(pineapple)
        self.view.addSubview(lastName)
        self.view.addSubview(firstName)
        self.view.addSubview(nextButton)
        setUpFirst()
        setUpLast()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpFirst(){
        let textFieldFrame = CGRect(x: 67, y: 355, width: 240, height: 60)
        firstName.placeholder="First Name"
        firstName.frame=textFieldFrame
        firstName.title="Your first name"
        firstName.textColor=UIColor.white
        firstName.lineColor=UIColor.white
        firstName.lineHeight=1
        
        firstName.selectedLineHeight=1
        firstName.selectedTitleColor=UIColor.white
        firstName.selectedLineColor=UIColor.white
        firstName.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        firstName.tintColor=UIColor.white
        firstName.placeholderColor=UIColor.white
        
    }
    func setUpLast(){
        let textFieldFrame = CGRect(x: 67, y: 437, width: 240, height: 60)
        lastName.placeholder="Last Name"
        lastName.frame=textFieldFrame
        lastName.title="Your last name"
        lastName.textColor=UIColor.white
        lastName.lineColor=UIColor.white
        lastName.lineHeight=1
        
        lastName.selectedLineHeight=1
        lastName.selectedTitleColor=UIColor.white
        lastName.selectedLineColor=UIColor.white
        lastName.placeholderFont=UIFont(name: "Raleway-Regular", size: 18)
        lastName.tintColor=UIColor.white
        lastName.placeholderColor=UIColor.white
        
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
