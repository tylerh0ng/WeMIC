//
//  sexAndSexualOrientation.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/15/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import AIFlatSwitch
import FirebaseAuth
import FirebaseDatabase
import Firebase
class sexAndSexualOrientation: UIViewController {

    var universalTracker=0
    var selectedButtonText=String()
  
    @IBOutlet weak var headerInfo: UITextView!
    
    @IBOutlet weak var moreInfo: UITextView!
    @IBOutlet weak var pineapple: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var fluidText: UITextView!
    @IBOutlet weak var femaleText: UITextView!
    @IBOutlet weak var maleText: UITextView!
    @IBOutlet weak var fluid: AIFlatSwitch!
    @IBOutlet weak var female: AIFlatSwitch!
    @IBOutlet weak var male: AIFlatSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(fluidText)
        self.view.addSubview(femaleText)
        self.view.addSubview(maleText)
        self.view.addSubview(fluid)
        self.view.addSubview(female)
        self.view.addSubview(male)
        self.view.addSubview(nextButton)
        self.view.addSubview(headerInfo)
        self.view.addSubview(moreInfo)
        self.view.addSubview(pineapple)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getSelectedButton(){
        if male.isSelected{
            selectedButtonText=maleText.text
        }
        if female.isSelected{
            selectedButtonText=femaleText.text
        }
        if fluid.isSelected{
            selectedButtonText=fluidText.text
        }
    }
    func checkHowManyButtonsAreSelected(){
        var tracker=0
        if male.isSelected{
            tracker=tracker+1
        }
        if female.isSelected{
            tracker=tracker+1
        }
        if fluid.isSelected{
            tracker=tracker+1
        }
        universalTracker=tracker
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        checkHowManyButtonsAreSelected()
        if universalTracker != 1{
            let alert=UIAlertController(title: "How many options did you select?", message: "Be sure to only check one option for your gender", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
        }
        else{
            getSelectedButton()
          let databaseRef=Database.database().reference()
            databaseRef.child("Users").child(Auth.auth().currentUser!.uid).child("Gender").setValue(selectedButtonText)
        }
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
