//
//  matchStream.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/22/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase
class matchStream: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var userMatchPreferences=String()
    var userGender=String()
    var poolToDraw1=String()
    var peopleArray:[String]=[String]()
    var randomNumberArray:[Int]=[Int]()
    var finalPeopleArray=[String]()
    var usedArray=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
  Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("oldPotential").observeSingleEvent(of: .value) { (snapshot) in
            if let oldMatch=snapshot.value as? String{
                self.usedArray.append(oldMatch)
            }
        }
        collectionView?.backgroundColor = .white
        let layout=UICollectionViewFlowLayout()
         layout.accessibilityScroll(.up)
        let cellsize=CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.itemSize=cellsize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing=0
        layout.minimumInteritemSpacing=0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView?.isPagingEnabled=true

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       /* if peopleArray.count<10{
            return peopleArray.count
        }*/
       return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier:"revisedCell", for: indexPath) as! CollectionViewCell
    
       /*let chosenID=finalPeopleArray[indexPath.row]
        let dataRef=Database.database().reference()
         dataRef.child("Users").child(chosenID).observeSingleEvent(of: .value) { (snapshot) in
            let personDict=snapshot as! NSDictionary
            let userName=personDict["User's full name"] as! String
          
            
            
        }
    */
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func getArrayOfMatches(){
        getUserGender()
        getUsersMatchPreferences()
        checkWhatPoolToDraw()
        getArray()
        
    }
    
    func getUsersMatchPreferences(){
        let currentUser=Auth.auth().currentUser!
        let dataRef=Database.database().reference()
        dataRef.child("Users").child(currentUser.uid).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary=snapshot.value as? [String:AnyObject]{
                self.userMatchPreferences=dictionary["AttractedTo"] as! String
                
            }
            
        }
    }
    
    func getArray(){
       let dataRef=Database.database().reference()
        dataRef.child("Users").child(Auth.auth().currentUser!.uid).child("oldPotentialMatches").observeSingleEvent(of: .value) { (snapshot) in
            let previousMatches=snapshot.value as? String
            if let oldPotential=previousMatches{
                self.usedArray.append(oldPotential)
            }
        }
        dataRef.child(poolToDraw1).observeSingleEvent(of: .value) { (snapshot) in
            let personBook=snapshot.value as? String
            if (personBook != nil) && !self.usedArray.contains(personBook!){
                self.peopleArray.append(personBook!)
            }
          
        }
        getRandomizedNumbers()
        for i in 0...9{
            let randomNumber=randomNumberArray[i]
            let randomID=peopleArray[randomNumber]
            finalPeopleArray.append(randomID)
            usedArray.append(randomID)
        }
        for i in 0...usedArray.count-1{
            dataRef.child("Users").child("")
        }
    }
    func getRandomizedNumbers(){
        var numIterations = 10
        if peopleArray.count < 10 {
            numIterations = peopleArray.count
        }
        for i in 0...numIterations{
            var randNumb = Int(arc4random_uniform(UInt32(peopleArray.count)))
            while randomNumberArray.contains(randNumb){
                randNumb=Int(arc4random_uniform(UInt32(peopleArray.count)))
            }
            randomNumberArray.append(randNumb)
        }
    }
    func checkWhatPoolToDraw(){
        if userGender=="Male" && userMatchPreferences=="Female"{
            poolToDraw1="BiFemaleStraightFemale"
        }
        if userGender=="Female" && userMatchPreferences=="Male"{
            poolToDraw1="BiMaleStraightMale"
        }
        if userGender=="Female" && userMatchPreferences=="Both"{
            poolToDraw1="StraightMaleGayFemaleBiFemale"
        }
        if userGender=="Male" && userMatchPreferences=="Both"{
            poolToDraw1="GayMaleStraightFemaleBiMale"
        }
        if userGender=="Male" && userMatchPreferences=="Male"{
            poolToDraw1="GayMaleBiMale"
        }
        if userGender=="Female" && userMatchPreferences=="Female"{
            poolToDraw1="BiFemaleGayFemale"
        }
  
    }
    func getUserGender(){
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: .value) { (snapshot) in
            let value=snapshot.value as! [String:String]
            let gender=value["Gender"] as!String
            self.userGender=gender
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
