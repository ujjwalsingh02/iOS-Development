//
//  EditProfileViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 06/04/23.
//

import UIKit
var dpImage : UIImage!
var dpchanged : Bool = false

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var editUsernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePhoto.image = UIImage(named: user1.userImageName)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeProfilePictureButtonTapped(_ sender: UIButton) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage{
            dpImage = image
            profilePhoto.image = dpImage
//            profilePhoto.image = image
            dpchanged = true
//            dpImage = image
        }
        picker.dismiss(animated: true,completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeUsernameButtonPressed(_ sender: UIButton) {
        
        if editUsernameTextField.text == confirmTextField.text{
            
            let alert = UIAlertController(title: "Edit profile", message: "Are you sure you want to make these changes to your profile?", preferredStyle: .alert)
            
            let yesButton = UIAlertAction(title: "Yes", style: .default){
                (action) in
                
                    user1.userName = self.editUsernameTextField.text!
                self.dismiss(animated: true)
                
            }
            //
            let noButton = UIAlertAction(title: "No", style: .default){
                (action) in
                
            }
            //
            alert.addAction(yesButton)
            alert.addAction(noButton)
            
            present(alert,animated: true,completion: nil)
            
        }
        else{
            
            let alert = UIAlertController(title: "Invalid Username", message: "Please enter same values in both the field.", preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "Ok", style: .default){
                (action) in
                
                    
            }
            alert.addAction(okButton)
            present(alert,animated: true,completion: nil)
        }
    }
    

}
