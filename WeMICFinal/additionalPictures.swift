//
//  additionalPictures.swift
//  WeMICFinal
//
//  Created by Tasha Mallow on 7/19/18.
//  Copyright © 2018 AlexLee. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import Firebase
import ImagePicker
class additionalPictures: UIViewController,ImagePickerDelegate {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var actualheader: UITextView!
    @IBOutlet weak var header: UITextView!
    @IBOutlet weak var pineapple: UIImageView!
    var selectedImage : UIImageView?=nil
    var tracker=0
    var pictures=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGradient()
        self.view.addSubview(nextButton)
        self.view.addSubview(image5)
        self.view.addSubview(image4)
        self.view.addSubview(image3)
        self.view.addSubview(image2)
        self.view.addSubview(image1)
        self.view.addSubview(actualheader)
        self.view.addSubview(header)
        self.view.addSubview(pineapple)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
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
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        imagePicker.dismiss(animated: true) {
            print("success")
        }
        selectedImage?.image=images[0]
        selectedImage?.layer.borderWidth = 1
        selectedImage?.layer.masksToBounds = false
        selectedImage?.layer.borderColor=UIColor.white.cgColor
        selectedImage?.layer.cornerRadius = (selectedImage?.frame.height)!/2
        selectedImage?.clipsToBounds = true
        selectedImage?.contentMode = .scaleAspectFill
       
        
    }
    
    @IBAction func additionalPic1Tapped(_ sender: Any) {
        selectedImage=image1
        let picker=ImagePickerController()
        picker.delegate=self
        picker.imageLimit=1
        present(picker, animated: true, completion: nil)
        
        
    }
    
  
    @IBAction func pic2Tapped(_ sender: Any) {
        selectedImage=image2
        let picker=ImagePickerController()
        picker.delegate=self
        picker.imageLimit=1
        present(picker, animated: true, completion: nil)
       
    }
    
    
    @IBAction func pic3tapped(_ sender: Any) {
        selectedImage=image3
        let picker=ImagePickerController()
        picker.delegate=self
        picker.imageLimit=1
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func pic4tapped(_ sender: Any) {
        selectedImage=image4
        let picker=ImagePickerController()
        picker.delegate=self
        picker.imageLimit=1
        present(picker, animated: true, completion: nil)
       
    }

    @IBAction func pic5tapped(_ sender: Any) {
        selectedImage=image5
        let picker=ImagePickerController()
        picker.delegate=self
        picker.imageLimit=1
        present(picker, animated: true, completion: nil)
      
        
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        checkIfImagesPresent()
        
    }
   
    func checkIfImagesPresent(){
        if image1.image != nil{
            
            selectedImage?.image=image1.image
            let selectedImageData=UIImageJPEGRepresentation((selectedImage?.image!)!, 1)
            let storageRef=Storage.storage().reference()
            let metadata=StorageMetadata()
            let reference=storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Pictures"+String(self.tracker))
            reference.putData(selectedImageData!, metadata: metadata) { (metadata, error) in
                if error != nil{
                    print("There was a problem uploading")
                    
                }
                else{
                    reference.downloadURL(completion: { (url, error) in
                    print("What's going on")
                    self.pictures.append((url?.absoluteString)!)
                    print(url?.absoluteString)
                          Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Additional Pics").child("1").setValue(url?.absoluteString)
                })

                }
                
            }
            
        }
        if image2.image != nil{
            selectedImage?.image=image1.image
            let selectedImageData=UIImageJPEGRepresentation((selectedImage?.image!)!, 1)
            let storageRef=Storage.storage().reference()
            let metadata=StorageMetadata()
            let reference=storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Pictures"+String(self.tracker))
            reference.putData(selectedImageData!, metadata: metadata) { (metadata, error) in
                if error != nil{
                    print("There was a problem uploading")
                    
                }
                else{
                    reference.downloadURL(completion: { (url, error) in
                        print("What's going on")
                        self.pictures.append((url?.absoluteString)!)
                        print(url?.absoluteString)
                          Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Additional Pics").child("2").setValue(url?.absoluteString)
                    })
                }
                
            }
           

        }
        if image3.image != nil{
            selectedImage?.image=image1.image
            let selectedImageData=UIImageJPEGRepresentation((selectedImage?.image!)!, 1)
            let storageRef=Storage.storage().reference()
            let metadata=StorageMetadata()
            let reference=storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Pictures"+String(self.tracker))
            reference.putData(selectedImageData!, metadata: metadata) { (metadata, error) in
                if error != nil{
                    print("There was a problem uploading")
                    
                }
                else{
                    reference.downloadURL(completion: { (url, error) in
                        print("What's going on")
                        self.pictures.append((url?.absoluteString)!)
                        print(url?.absoluteString)
                         Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Additional Pics").child("3").setValue(url?.absoluteString)
                    })
                }
                
            }
            tracker=tracker+1

        }
        if image4.image != nil{
            selectedImage?.image=image1.image
            let selectedImageData=UIImageJPEGRepresentation((selectedImage?.image!)!, 1)
            let storageRef=Storage.storage().reference()
            let metadata=StorageMetadata()
            let reference=storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Pictures"+String(self.tracker))
            reference.putData(selectedImageData!, metadata: metadata) { (metadata, error) in
                if error != nil{
                    print("There was a problem uploading")
                    
                }
                else{
                    reference.downloadURL(completion: { (url, error) in
                        print("What's going on")
                        self.pictures.append((url?.absoluteString)!)
                        print(url?.absoluteString)
                         Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Additional Pics").child("4").setValue(url?.absoluteString)
                    })
                }
                
            }
            tracker=tracker+1

        }
        if image5.image != nil{
            selectedImage?.image=image1.image
            let selectedImageData=UIImageJPEGRepresentation((selectedImage?.image!)!, 1)
            let storageRef=Storage.storage().reference()
            let metadata=StorageMetadata()
            let reference=storageRef.child("Users").child(Auth.auth().currentUser!.uid).child("Pictures"+String(self.tracker))
            reference.putData(selectedImageData!, metadata: metadata) { (metadata, error) in
                if error != nil{
                    print("There was a problem uploading")
                    
                }
                else{
                    reference.downloadURL(completion: { (url, error) in
                        print("What's going on")
                        self.pictures.append((url?.absoluteString)!)
                        print(url?.absoluteString)
                          Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Additional Pics").child("5").setValue(url?.absoluteString)
                    })
                }
                
            }
           

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
