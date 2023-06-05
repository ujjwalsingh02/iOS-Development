//
//  LeaderBoardsViewController.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 29/03/23.
//

import UIKit

class LeaderBoardsViewController: UIViewController {

    
    @IBOutlet weak var leaderboardTableView: UITableView!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var totalUserLabel: UILabel!
    @IBOutlet weak var currentRankLabel: UILabel!
    
    var leaderboardUser = [LeaderboardPage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentRankLabel.text = "\(user1.userRank.currRank)"
        totalUserLabel.text = "/ \(user1.userRank.totalUser)"
        totalPointsLabel.text = "\(user1.points.totalPoints)"
        
        let user1 = LeaderboardPage(username: "ujjwaall", points: 1500)
        leaderboardUser.append(user1)
        
        let user2 = LeaderboardPage(username: "kushver", points: 1480)
        leaderboardUser.append(user2)
        
        let user3 = LeaderboardPage(username: "john", points: 1450)
        leaderboardUser.append(user3)

        let user4 = LeaderboardPage(username: "raman", points: 1430)
        leaderboardUser.append(user4)

        let user5 = LeaderboardPage(username: "lokesh", points: 1410)
        leaderboardUser.append(user5)

        let user6 = LeaderboardPage(username: "virat", points: 1390)
        leaderboardUser.append(user6)

        let user7 = LeaderboardPage(username: "mahendra", points: 1370)
        leaderboardUser.append(user7)

        let user8 = LeaderboardPage(username: "rohit", points: 1350)
        leaderboardUser.append(user8)

        let user9 = LeaderboardPage(username: "cristiano", points: 1330)
        leaderboardUser.append(user9)

        let user10 = LeaderboardPage(username: "lionel", points: 1310)
        leaderboardUser.append(user10)
        
        leaderboardTableView.tableFooterView = UIView(frame: .zero)
    }
    
}


extension LeaderBoardsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = leaderboardTableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! LeaderboardTableViewCell
        cell.rankLabel.text = "\(indexPath.row+1)"
        cell.usernameLabel.text = leaderboardUser[indexPath.row].username
        cell.pointsLabel.text = "\(leaderboardUser[indexPath.row].points)"
        cell.userImage.image = UIImage(named: "dp")
        cell.notChangingPoint.text = "Points"
        
        return cell
    }
    
    
}
