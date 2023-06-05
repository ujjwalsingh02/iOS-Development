//
//  LeaderboardTableViewCell.swift
//  OREAppNew
//
//  Created by Ujjwalsingh Rajput on 29/03/23.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    @IBOutlet weak var notChangingPoint: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
