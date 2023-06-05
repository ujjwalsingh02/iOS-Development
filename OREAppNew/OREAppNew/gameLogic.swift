//
//  gameLogic.swift
//  OnMyOwnTry
//
//  Created by Ujjwalsingh Rajput on 30/03/23.
//

import Foundation
import UIKit
 
var countRow = 0
var attempts_used: Int = 0
// code generate karne ke liye
func generateSecretCode() -> [String]{
    var secretCode: [String] = []
    let colors : [String] = ["red", "green", "vibrant yellow", "dark blue", "cyan blue", "dark magenta", "orange", "brown"]
    while secretCode.count<4 {
        let randomIndex = Int.random(in: 0..<colors.count)
        let temp : String = colors[randomIndex]
        if !secretCode.contains(temp){
            secretCode.append(temp)
        }
    }
    
    return secretCode
}

// dekhne ke liye count 4 hai ya nhi
func checkCount() -> Bool{
    var count = 0

    for i in guess{
        if i != "" {
            count = count + 1
            countRow = countRow + 1
        }
    }
    print(count)
    if count == 4{
        return true
    }
    else{
        return false
    }
    
}


// secretCode and guess ko compare karne ke liye
func compareGuessToSecretCode(guess: [String], secretCode: [String]) -> (cpos: Int, ccol: Int) {
    var cpos = 0 // Counter for number of elements in the correct position
    var ccol = 0 // Counter for number of elements present in the code but in the wrong position
    
    
    for i in 0..<guess.count {
        // Check if the current element is present in the secretCode
        if secretCode.contains(guess[i]) {
            // If the element is in the same position, increment cpos
            if guess[i] == secretCode[i] {
                cpos += 1
            } else {
                // If the element is in a different position, increment ccol
                ccol += 1
            }
        }
    }
   
    if(cpos == 4){

        print("Attempts used = ", attempts_used)
        print(user1.level.attempts - attempts_used)
        if(user1.level.attempts - attempts_used >= 5 ){
            user1.points.currLevelPoints = user1.points.totalPointsOfLevel
        }
        else if(user1.level.attempts - attempts_used == 4){
            user1.points.currLevelPoints = user1.points.totalPointsOfLevel - 10
        }
        else if(user1.level.attempts - attempts_used == 3){
            user1.points.currLevelPoints = user1.points.totalPointsOfLevel - 20
        }
        else if(user1.level.attempts - attempts_used == 2){
            user1.points.currLevelPoints = user1.points.totalPointsOfLevel - 30
        }
        else if(user1.level.attempts - attempts_used == 1){
            user1.points.currLevelPoints = user1.points.totalPointsOfLevel - 50
        }
        else{
            user1.points.currLevelPoints = 0
        }
        
    }
        print("You have scored ", user1.points.currLevelPoints, "Points")
    
    return (cpos, ccol) // Return the tuple containing cpos and ccol
}


//let alert = UIAlertController(title: "Edit profile", message: "Are you sure you want to make these changes to your profile?", preferredStyle: .alert)
//
//let yesButton = UIAlertAction(title: "Yes", style: .default){
//    (action) in
//
//        user1.userName = self.editUsernameTextField.text!
//    self.dismiss(animated: true)
//
//}


//@IBAction func changeUsernameButtonPressed(_ sender: UIButton) {
//
//    if editUsernameTextField.text == confirmTextField.text{
//        
//        let alert = UIAlertController(title: "Edit profile", message: "Are you sure you want to make these changes to your profile?", preferredStyle: .alert)
//
//        let yesButton = UIAlertAction(title: "Yes", style: .default){
//            (action) in
//
//                user1.userName = self.editUsernameTextField.text!
//            self.dismiss(animated: true)
//
//        }
//        //
//        let noButton = UIAlertAction(title: "No", style: .default){
//            (action) in
//
//        }
//        //
//        alert.addAction(yesButton)
//        alert.addAction(noButton)
//
//        present(alert,animated: true,completion: nil)
//
//    }
//    else{
//
//        let alert = UIAlertController(title: "Invalid Username", message: "Please enter same values in both the field.", preferredStyle: .alert)
//
//        let okButton = UIAlertAction(title: "Ok", style: .default){
//            (action) in
//
//
//        }
//        alert.addAction(okButton)
//        present(alert,animated: true,completion: nil)
//    }
//}
