//
//  LoginScreenViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 29/03/23.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginDetails  = UserDefaults.standard.value(forKey: "username")
        if loginDetails != nil{
            
            usernameTextField.text = UserDefaults.standard.value(forKey: "username") as? String
            nameTextField.text = UserDefaults.standard.value(forKey: "name") as? String
            passwordTextField.text = UserDefaults.standard.value(forKey: "password") as? String
        }
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
//        let alert = UIAlertController(title: "Saving", message: "Save Login Details?", preferredStyle: .alert)
        
//        let yesButton = UIAlertAction(title: "Yes", style: .default){
//            (action) in
            
            UserDefaults.standard.set(self.nameTextField.text!, forKey: "name")
            UserDefaults.standard.set(self.usernameTextField.text! , forKey: "username")
            UserDefaults.standard.set(self.passwordTextField.text!, forKey: "password")
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "homeStart") as! UITabBarController
            
            controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve

            self.present(controller,animated: true,completion: nil)
//        }
//
//        let noButton = UIAlertAction(title: "No", style: .default){
//            (action) in
//            print("You have not saved login details.")
//
//
//            let controller = self.storyboard?.instantiateViewController(withIdentifier: "homeStart") as! UITabBarController
//
//            controller.modalPresentationStyle = .fullScreen
//            controller.modalTransitionStyle = .coverVertical
//
//            self.present(controller,animated: true,completion: nil)
//        }
//
//        alert.addAction(yesButton)
//        alert.addAction(noButton)
//
//        present(alert,animated: true,completion: nil)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToHomeSegue"{
            
            let desVC = segue.destination as! HomeViewController
            desVC.userpass = "\(usernameTextField.text!)"
            desVC.namepass = "\(nameTextField.text!)"
        }
    }
    
}
