//
//  SettingViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 28/03/23.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var backgroundImages: [UIImageView]!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = user1.userName
        name.text = user1.name
        profilePhoto.image = UIImage(named: user1.userImageName)
        backgroundImages[0].image = UIImage(named: "ORE 2 Small")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        userName.text = user1.userName
        name.text = user1.name
        if dpchanged{
            profilePhoto.image = dpImage
        }else{
            profilePhoto.image = UIImage(named: user1.userImageName)
        }
        backgroundImages[0].image = UIImage(named: "ORE 2 Small")
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset all your progress?", preferredStyle: .alert)
                
        let yesButton = UIAlertAction(title: "Yes", style: .default){
                    (action) in
                    
            print("You have opted to reset all your data.")
                    
            user1.points.totalPoints = 0;
            user1.points.totalPointsOfLevel = 0;
            user1.userRank.currRank = user1.userRank.totalUser
            user1.level.currLevel = 1
            user1.streak.currDays = 1
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
    
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)
                
                let yesButton = UIAlertAction(title: "Yes", style: .default){
                    (action) in
                    
                    print("You have opted to log out.")
        
                    var user2 : User = user1
                    user1 = guest
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "homeStart") as! UIViewController
                    
                    controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .crossDissolve

                    self.present(controller,animated: true,completion: nil)
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
    
    @IBAction func changeBackgroundButtonPressed(_ sender: UIButton) {
       
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    

}


extension SettingViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage{
            globalBackgroundImage = image
        }
        picker.dismiss(animated: true,completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
