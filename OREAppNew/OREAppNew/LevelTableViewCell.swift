//
//  LevelTableViewCell.swift
//  OREAppNew
//
//  Created by Kushagra Verma on 30/03/23.
//

import UIKit

class LevelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var LevelNumber: UILabel!
    @IBOutlet weak var LevelStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
