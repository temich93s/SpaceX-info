//
//  SpaceRocketInfoViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import UIKit

class SpaceRocketInfoViewController: UIViewController {

    @IBOutlet weak var flickrImages: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var watchLaunchButton: UIButton!
    
    @IBOutlet var characteristicRocketViews: [UIView]!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var diameterValue: UILabel!
    @IBOutlet weak var diameter: UILabel!
    @IBOutlet weak var massValue: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var payloadWeightsValue: UILabel!
    @IBOutlet weak var payloadWeights: UILabel!
    
    @IBOutlet weak var firstFlightValue: UILabel!
    @IBOutlet weak var countryValue: UILabel!
    @IBOutlet weak var costPerLaunchValue: UILabel!
    
    @IBOutlet weak var enginesFirstValue: UILabel!
    @IBOutlet weak var fuelAmountTonsFirstValue: UILabel!
    @IBOutlet weak var fuelAmountTonsFirstScale: UILabel!
    @IBOutlet weak var burnTimeSecFirstValue: UILabel!
    @IBOutlet weak var burnTimeSecFirstScale: UILabel!
    
    @IBOutlet weak var enginesSecondValue: UILabel!
    @IBOutlet weak var fuelAmountTonsSecondValue: UILabel!
    @IBOutlet weak var fuelAmountTonsSecondScale: UILabel!
    @IBOutlet weak var burnTimeSecSecondValue: UILabel!
    @IBOutlet weak var burnTimeSecSecondScale: UILabel!
    
    var index = 0
    var rocketData: Rocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func settingButton(_ sender: UIButton) {
    }
    
    @IBAction func watchLaunch(_ sender: UIButton) {
    }
    
    func setUI() {
        for characteristicRocketView in characteristicRocketViews {
            characteristicRocketView.layer.cornerRadius = characteristicRocketView.frame.height / 4
        }
        watchLaunchButton.layer.cornerRadius = watchLaunchButton.frame.height / 4
    }
    
    
}
