//
//  GameTableViewCell.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 06/04/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    
    @IBOutlet var outputSymbol: [UIImageView]!
    
    @IBOutlet var tableInputButtons: [UIButton]!
    
    var mainButtonPressedVar = false
    
    
    @IBAction func tableInputButtonPressed(_ sender: UIButton) {
        for i in 0..<4{
            tableInputButtons[i].tag = i
        }
        sender.tintColor = UIColor.systemBlue
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
//        GameViewController().AttemptsRemaingLabel.text = "Attempts left: " + String(user1.level.attempts - attempts_used)
        let check = checkCount()

        if check{
            let (gree, yell) = compareGuessToSecretCode(guess: guess, secretCode: secretCode)
            outputDisplay(yell: yell, gree: gree)
//            if(gree == 4){
//                showCompletionScreen()}
//                func showCompletionScreen(){
//                    let alert = UIAlertController(title: "LEVEL COMPLETED", message: "YOU SCORED \(user1.points.currLevelPoints)", preferredStyle: .alert)
//
//                    alert.addAction(UIAlertAction(title: "Home", style: .default, handler: {
//                        action in
//                    }))
//                    present(alert, animated: true)
//
//            }
            
        }
        
        guess = ["", "", "", ""]
        
    }
    
    func outputDisplay(yell : Int, gree : Int){
//        if(yell+gree)>4{
//            print("GT 4")
//        }
        for i in 0..<yell{
            outputSymbol[i].tintColor = .yellow
        }

//        let rem = 4-yell

        for i in yell..<yell+gree{
            outputSymbol[i].tintColor = .green
        }
//        if(gree == 4){
//            showCompletionScreen()
//        }
//        func showCompletionScreen(){
//            let alert = UIAlertController(title: "LEVEL COMPLETED", message: "YOU SCORED \(user1.points.currLevelPoints)", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "Home", style: .default, handler: {
//                action in
//            }))
//            self.present(alert, animated: true)
//        }

            

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
