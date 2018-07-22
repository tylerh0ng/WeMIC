//
//  pickPhoto.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/18/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import ImagePicker
import FirebaseStorage
import FirebaseAuth
import Firebase
class pickPhoto: UIViewController,ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true) {
            print("success")
        }
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true) {
            print("success")
        }
    }
    
    @IBOutlet weak var nextButtonPressed: UIButton!
    @IBOutlet weak var pineapple: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
   
    @IBOutlet weak var header: UITextView!
    var selectedImage=UIImageView()
    
    @IBAction func profilePicTapGesture(_ sender: Any) {
        selectedImage=profilePic
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.imageLimit=1
        present(imagePickerController, animated: true, completion: nil)
       
    }
    @IBAction func nexButtonPressed(_ sender: Any) {
       
        let selectedImageData=UIImageJPEGRepresentation(selectedImage.image!, 1)
        let storageRef=Storage.storage().reference()
        let metadata=StorageMetadata()
        storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Profile Picture").putData(selectedImageData!, metadata: metadata) { (metadata, error) in
            if error != nil{
                print("There was a problem uploading")
                return
            }
            storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Profile Picture").downloadURL(completion: { (url, error) in
                print("What's going on")
                let databaseRef=Database.database().reference()
                databaseRef.child("Users").child(Auth.auth().currentUser!.uid).child("Profile Picture").setValue(url?.absoluteString)
            })
          
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(pineapple)
       
        self.view.addSubview(profilePic)
        self.view.addSubview(header)
      self.view.addSubview(nextButtonPressed)
        
        // Do any additional setup after loading the view.
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        imagePicker.dismiss(animated: true) {
            print("success")
        }
        selectedImage.image=images[0]
        selectedImage.layer.borderWidth = 1
        selectedImage.layer.masksToBounds = false
        selectedImage.layer.borderColor=UIColor.white.cgColor
        selectedImage.layer.cornerRadius = selectedImage.frame.height/2
        selectedImage.clipsToBounds = true
        selectedImage.contentMode = .scaleAspectFill
        self.view.addSubview(selectedImage)
        
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
