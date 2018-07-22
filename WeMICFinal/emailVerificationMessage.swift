//
//  emailVerificationMessage.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/14/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class emailVerificationMessage: UIViewController {

    @IBOutlet weak var pineapple: UIImageView!
    @IBOutlet weak var verificationMessage: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonTapped(_ sender: Any) {
        Auth.auth().currentUser?.reload(completion: { (result) in
            if result==nil{
                print("success")
            }
        })
        if Auth.auth().currentUser?.isEmailVerified==true{
            performSegue(withIdentifier: "alreadyVerified", sender: sender)
        }
            else{
            let alert=UIAlertController(title: "Are you sure you're verified?", message: "Our database shows you have not been verified yet. Please do so or request another verification email below.", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(pineapple)
        self.view.addSubview(verificationMessage)
        self.view.addSubview(nextButton)
        let gameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

        
    }
    @objc func runTimedCode(){
        Auth.auth().currentUser!.reload { (Error) in
            if Error != nil{
                print("error occured")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
