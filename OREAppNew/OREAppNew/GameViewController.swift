//
//  GameViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 06/04/23.
//

import UIKit

var guess : [String] = ["", "", "", ""]
//var count = 0
var secretCode : [String] = ["", "", "", ""]
var colors : [String] = ["red", "green", " vibrant yellow", "dark blue", "cyan blue", "dark magenta", "orange", "brown"]

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var AttemptsRemaingLabel: UILabel!
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return level1.attempts
        }
   // navigationItem.title = "Attempts left : " + String(AttemptsLeft)

        @IBOutlet weak var myTableView: UITableView!
        
        @IBOutlet var colorButtons: [UIButton]!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            AttemptsRemaingLabel.text = "Total Attempts: " + String(user1.level.attempts)
            myTableView.delegate = self
            myTableView.dataSource = self
            colorButtons[0].tintColor = UIColor.systemRed
            colorButtons[1].tintColor = UIColor.systemGreen
            colorButtons[2].tintColor = UIColor.systemYellow
            colorButtons[3].tintColor = UIColor.blue
            colorButtons[4].tintColor = UIColor.systemCyan
            colorButtons[5].tintColor = UIColor.magenta
            colorButtons[6].tintColor = UIColor.systemOrange
            colorButtons[7].tintColor = UIColor.systemBrown
            
    //        print(guess)
            secretCode = generateSecretCode()
    //        secretCode = ["red", "green", "yellow","blue"]
            print(secretCode)
        }
    

        override func viewWillAppear(_ animated: Bool) {
           // print("From the controller", attempts_used)
  //          AttemptsRemaingLabel.text = "Attempts left: " + String(user1.level.attempts - attempts_used)
        }
    
        var selectedInputButton: UIButton?
        var number : Int = -1
        var countRow : Int = 0

            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! GameTableViewCell
                // Set the target and action for all the table input buttons
                for button in cell.tableInputButtons {
                    button.addTarget(self, action: #selector(tableInputButtonPressed(_:)), for: .touchUpInside)
                }

                return cell
            }

            @objc func tableInputButtonPressed(_ sender: UIButton) {
                // Store the selected input button
                selectedInputButton = sender
                number = sender.tag
            }

        @IBAction func colorButtonPressed(_ sender: UIButton) {
            guard let selectedButton = selectedInputButton else { return }

                    // Set the tint color of the selected input button to the color of the pressed color button
            selectedButton.tintColor = sender.tintColor
            guess[number] = (sender.tintColor).accessibilityName
            print(guess)
        }
        


}
