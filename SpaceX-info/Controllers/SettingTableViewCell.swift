//
//  SettingTableViewCell.swift
//  SpaceX-info
//
//  Created by 2lup on 28.08.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var indexCell = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        switch indexCell {
        case 0:
            if sender.selectedSegmentIndex == 0 {
                ScaleOfNotation.heightScale = "m"
            } else {
                ScaleOfNotation.heightScale = "ft"
            }
        case 1:
            if sender.selectedSegmentIndex == 0 {
                ScaleOfNotation.diameterScale = "m"
            } else {
                ScaleOfNotation.diameterScale = "ft"
            }
        case 2:
            if sender.selectedSegmentIndex == 0 {
                ScaleOfNotation.massScale = "kg"
            } else {
                ScaleOfNotation.massScale = "lb"
            }
        case 3:
            if sender.selectedSegmentIndex == 0 {
                ScaleOfNotation.payloadWeightsScale = "kg"
            } else {
                ScaleOfNotation.payloadWeightsScale = "lb"
            }
        default:
            break
        }
    }
    
}
