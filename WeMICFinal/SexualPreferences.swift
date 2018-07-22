//
//  SexualPreferences.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/16/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import AIFlatSwitch
import FirebaseDatabase
import FirebaseAuth
import Firebase
class SexualPreferences: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bothButton: AIFlatSwitch!
    @IBOutlet weak var femaleButton: AIFlatSwitch!
    @IBOutlet weak var maleButton: AIFlatSwitch!
    @IBOutlet weak var bothText: UITextView!
    @IBOutlet weak var femaleText: UITextView!
    @IBOutlet weak var maleText: UITextView!
    @IBOutlet weak var moreInfo: UITextView!
    @IBOutlet weak var openingstatement: UITextView!
    @IBOutlet weak var pineapple: UIImageView!
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let databaseRef=Database.database().reference()
        databaseRef.child("Users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: .value) { (snapshot) in
            let value=snapshot.value as! [String:String]
            let gender=value["Gender"] as!String
            /* what happens if we have picture arrays? will get complicated
 */
            self.universalGender=gender
            self.checkHowManyButtonsAreSelected()
            if self.universalTracker != 1{
                let alert=UIAlertController(title: "How many options did you select?", message: "Be sure to only check one option", preferredStyle: .alert)
                let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                    print(cancel)
                }
                alert.addAction(ok)
                self.present(alert,animated:true,completion:nil)
            }
            else{
                self.getSelectedButton()
                databaseRef.child("Users").child(Auth.auth().currentUser!.uid).child("AttractedTo").setValue(self.selectedButtonText)
                if (self.selectedButtonText == "Male") && (self.universalGender == "Female"){
                    databaseRef.child("FemalesAttractedToMales").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                if (self.selectedButtonText == "Female") && (self.universalGender == "Male"){
                    Database.database().reference().child("MalesAttractedToFemales").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                if (self.selectedButtonText == "Male") && (self.universalGender == "Male"){
                    databaseRef.child("MalesAttractedToMales").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                if (self.selectedButtonText == "Female") && (self.universalGender == "Female"){
                    databaseRef.child("FemalesAttractedToFemales").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                if (self.selectedButtonText == "Both") && (self.universalGender == "Male"){
                    databaseRef.child("MalesAttractedToBoth").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                if (self.selectedButtonText == "Both") && (self.universalGender == "Female"){
                    databaseRef.child("FemalesAttractedToBoth").child(Auth.auth().currentUser!.uid).setValue(Auth.auth().currentUser!.uid)
                }
                
            }
            
        }
        
    }
    
    var universalTracker=0
    var universalGender=String()
    var selectedButtonText=String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(bothText)
        self.view.addSubview(bothButton)
        self.view.addSubview(maleText)
        self.view.addSubview(maleButton)
        self.view.addSubview(femaleText)
        self.view.addSubview(femaleButton)
        self.view.addSubview(moreInfo)
        self.view.addSubview(openingstatement)
        self.view.addSubview(pineapple)
        self.view.addSubview(nextButton)
        // Do any additional setup after loading the view.
    }
    func checkHowManyButtonsAreSelected(){
        var tracker=0
        if maleButton.isSelected{
            tracker=tracker+1
        }
        if femaleButton.isSelected{
            tracker=tracker+1
        }
        if bothButton.isSelected{
            tracker=tracker+1
        }
        universalTracker=tracker
    }
    func getSelectedButton(){
        if maleButton.isSelected{
            selectedButtonText=maleText.text
        }
        if femaleButton.isSelected{
            selectedButtonText=femaleText.text
        }
        if bothButton.isSelected{
            selectedButtonText=bothText.text
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
