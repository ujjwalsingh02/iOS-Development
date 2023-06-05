//
//  LevelsViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 21/03/23.
//

import UIKit

class LevelsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var CurrentLevelLabel: UILabel!
    @IBOutlet weak var CurrentLevelPoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentLevelLabel.text  = "Level "+String(user1.level.currLevel)+"/"+String(user1.level.totalLevels)
        CurrentLevelPoints.text = String(user1.points.currLevelPoints)+" Points"
        
        let level1 = LevelPage(currentLevel: 1, levelStatus: "Level Completed", locked: false, attempted: true)
        levelPageUser.append(level1)
        
        let level2 = LevelPage(currentLevel: 2, levelStatus: "Level Completed", locked: false, attempted: true)
        levelPageUser.append(level2)
        
        let level3 = LevelPage(currentLevel: 3, levelStatus: "Begin Level", locked: false, attempted: false)
        levelPageUser.append(level3)
        
        let level4 = LevelPage(currentLevel: 4, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level4)
        
        let level5 = LevelPage(currentLevel: 5, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level5)
        
        let level6 = LevelPage(currentLevel: 6, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level6)
        
        let level7 = LevelPage(currentLevel: 7, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level7)
        
        let level8 = LevelPage(currentLevel: 8, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level8)
        
        let level9 = LevelPage(currentLevel: 9, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level9)
        
        let level10 = LevelPage(currentLevel: 10, levelStatus: "Level Locked", locked: true, attempted: false)
        levelPageUser.append(level10)
        
        tabel.tableFooterView = UIView(frame: .zero)
        tabel.dataSource = self
        tabel.delegate = self
    }
    @IBOutlet weak var tabel: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelPageUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabel.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! LevelTableViewCell
        if(levelPageUser[indexPath.row].locked == true){
            cell.PlayButton.setImage(UIImage(systemName: "lock.circle"), for: .normal)
            cell.LevelNumber.text = "Level " + "\(indexPath.row+1)"
            cell.LevelStatus.text = levelPageUser[indexPath.row].levelStatus
            cell.PlayButton.tintColor = UIColor.gray
        }
        if(levelPageUser[indexPath.row].locked == false){
            cell.PlayButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            cell.LevelNumber.text = "Level " + "\(indexPath.row+1)"
            if(levelPageUser[indexPath.row].attempted == false){
                cell.PlayButton.tintColor = UIColor.systemBlue
                
                cell.LevelStatus.text = levelPageUser[indexPath.row].levelStatus}
        }
        if(levelPageUser[indexPath.row].locked == false){
            cell.PlayButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            cell.LevelNumber.text = "Level " + "\(indexPath.row+1)"
            if(levelPageUser[indexPath.row].attempted == true){
                cell.PlayButton.tintColor = UIColor.systemGreen
                cell.LevelStatus.text = levelPageUser[indexPath.row].levelStatus}
        }


        
        
        
        return cell
        
        
    }
    
}
