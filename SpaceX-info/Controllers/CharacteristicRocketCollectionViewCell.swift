//
//  CharacteristicRocketCollectionViewCell.swift
//  SpaceX-info
//
//  Created by 2lup on 30.08.2022.
//

import UIKit

class CharacteristicRocketCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var characteristic: UILabel!
    @IBOutlet weak var characteristicRocketView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
