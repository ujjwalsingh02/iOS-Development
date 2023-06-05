//
//  DataModel.swift
//  OREApp

import Foundation
import UIKit


var leaderboardUsers : [String] = [""]
var levelPageUsers : [String] = [""]
struct User{
    let id : Int
    var userName : String
    let name : String
    var points : Points
    var userRank : Rank
    var level : Level
    var streak : Streak
    var userImageName : String
}


var users:[User] = []

struct Rank{
    var currRank: Int
    var totalUser: Int
}

struct Level{
    var currLevel : Int
    var attempts : Int
    var totalLevels: Int
   // var time : Int//Should we keep the time component?
    var numberOfColors : Int
    var locked : Bool
    var attempted : Bool
}

//struct Row{
//    var color1 = UIView
//    var color2 : UIView
//    var Color3 : UIView
//    var Color4 : UIView
//}

struct Points{
    var currLevelPoints : Int
    var totalPointsOfLevel : Int
    var totalPoints : Int
}

struct Streak{
    var startDate : Date
    var currDays : Int
    var reward : Points
}

struct BackgroundImage{
    var images : [UIImage]
}

class LevelPage{
    var currentLevel: Int
    var levelStatus: String
    var locked : Bool
    var attempted : Bool

    init(currentLevel: Int, levelStatus: String, locked : Bool, attempted : Bool) {
        self.currentLevel = currentLevel
        self.levelStatus = levelStatus
        self.locked = locked
        self.attempted = attempted
    }
}
var levelPageUser : [LevelPage] = []

class LeaderboardPage{
    var username : String
    var points : Int
    
    init(username: String, points: Int) {
        self.username = username
        self.points = points
    }
}
 
var leaderboardUser : [LeaderboardPage] = []

struct Leaderboard{
    var points : Points
//    var currRank : Int
//    var totalUser: Int
    var rank: Rank
    var user: User
    var image: String
}

struct Settings{
    var reset: Bool
}


var user1 = User(id: 1, userName: (UserDefaults.standard.value(forKey: "username") as? String)!, name: (UserDefaults.standard.value(forKey: "name") as? String)!,points: Points(currLevelPoints: 0, totalPointsOfLevel: 100 ,totalPoints: 1500), userRank: (Rank(currRank: 4, totalUser: 75)), level: Level(currLevel: 4, attempts: 15, totalLevels: 7, numberOfColors: 8, locked: false, attempted: true), streak: Streak(startDate: Date(), currDays: 1, reward: Points(currLevelPoints: 0, totalPointsOfLevel: 100, totalPoints: 1500)), userImageName: "dp")

var guest = User(id: 1000, userName: "guest1578", name: "Guest", points: Points(currLevelPoints: 0, totalPointsOfLevel: 100, totalPoints: 0), userRank: Rank(currRank: 75, totalUser: 75), level: Level(currLevel: 1, attempts: 15, totalLevels: 10, numberOfColors: 8, locked: false, attempted: true), streak: Streak(startDate: Date(), currDays: 1, reward: Points(currLevelPoints: 0, totalPointsOfLevel: 100, totalPoints: 0)), userImageName: "sample-profile")

var level1 = Level(currLevel: 1, attempts: 15,totalLevels: 7, numberOfColors: 8, locked: false, attempted: true)

var leaderBoard1 = Leaderboard(points: Points(currLevelPoints: 40, totalPointsOfLevel: 50,totalPoints: 1500), rank: Rank(currRank: 1, totalUser: 75), user: user1, image: "dp")



