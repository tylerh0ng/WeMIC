//
//  classYear.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/14/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import AIFlatSwitch
import FirebaseAuth
import Firebase
class classYear: UIViewController {

    @IBOutlet weak var moreInfo: UITextView!
    @IBOutlet weak var whatYear: UITextView!
    @IBOutlet weak var pineapple: UIImageView!
    @IBOutlet weak var sophtext: UITextView!
    @IBOutlet weak var froshtext: UITextView!
    @IBOutlet weak var juniortext: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var seniortext: UITextView!
    @IBOutlet weak var masterstext: UITextView!
    @IBAction func nextButtonTapped(_ sender: Any) {
        checkHowManyButtonsAreSelected()
        if universalTracker != 1{
            let alert=UIAlertController(title: "How many options did you select?", message: "Be sure to only check one option for your class year", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default) { (cancel) in
                print(cancel)
            }
            alert.addAction(ok)
            self.present(alert,animated:true,completion:nil)
        }
        else{
            getSelectedButton()
            let databaseRef=Database.database().reference()
        databaseRef.child("Users").child(Auth.auth().currentUser!.uid).child("User's Year").setValue(selectedButtonText)
        }
    }
    @IBOutlet weak var masters: AIFlatSwitch!
    @IBOutlet weak var senior: AIFlatSwitch!
    @IBOutlet weak var junior: AIFlatSwitch!
    @IBOutlet weak var soph: AIFlatSwitch!
    @IBOutlet weak var frosh: AIFlatSwitch!
    var selectedSwitch:AIFlatSwitch=AIFlatSwitch()
    var universalTracker=0
    var selectedButtonText=String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(frosh)
        self.view.addSubview(soph)
        self.view.addSubview(junior)
        self.view.addSubview(senior)
        self.view.addSubview(masters)
        self.view.addSubview(froshtext)
        self.view.addSubview(sophtext)
        self.view.addSubview(juniortext)
        self.view.addSubview(seniortext)
        self.view.addSubview(masterstext)
        self.view.addSubview(pineapple)
       self.view.addSubview(whatYear)
        self.view.addSubview(moreInfo)
        self.view.addSubview(nextButton)
    // Do any additional setup after loading the view.
    }
    func getSelectedButton(){
        if frosh.isSelected{
            selectedButtonText=froshtext.text
        }
        if soph.isSelected{
            selectedButtonText=sophtext.text
        }
        if junior.isSelected{
            selectedButtonText=juniortext.text
        }
        if senior.isSelected{
            selectedButtonText=seniortext.text
        }
        if masters.isSelected{
            selectedButtonText=masterstext.text
        }
    }
    func checkHowManyButtonsAreSelected(){
        var tracker=0
        /*put in array, and then cycle through
 */
        if frosh.isSelected{
            tracker=tracker+1
        }
        if soph.isSelected{
            tracker=tracker+1
        }
        if junior.isSelected{
            tracker=tracker+1
        }
        if senior.isSelected{
           tracker=tracker+1
        }
        if masters.isSelected{
            tracker=tracker+1
        }
        universalTracker=tracker
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
