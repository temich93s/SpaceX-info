//
//  LaunchesTableViewCell.swift
//  SpaceX-info
//
//  Created by 2lup on 29.08.2022.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLaunch: UILabel!
    @IBOutlet weak var dataLaunch: UILabel!
    @IBOutlet weak var successLaunch: UIImageView!
    @IBOutlet weak var backgroundLaunchesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundLaunchesView.layer.cornerRadius = backgroundLaunchesView.frame.height / 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
