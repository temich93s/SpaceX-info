//
//  SpaceRocketInfoViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import UIKit

class SpaceRocketInfoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
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
    @IBOutlet weak var burnTimeSecFirstValue: UILabel!
    
    @IBOutlet weak var enginesSecondValue: UILabel!
    @IBOutlet weak var fuelAmountTonsSecondValue: UILabel!
    @IBOutlet weak var burnTimeSecSecondValue: UILabel!
    
    var index = 0
    var rocketData: Rocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDataOnUI()
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
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func setDataOnUI() {
        if let safeRocketData = rocketData {
            
            let randomNumberImage = Int.random(in: 1...safeRocketData.flickr_images.count) - 1
            let url = URL(string: safeRocketData.flickr_images[randomNumberImage])
            // в асиинхроном потоке пытаемся получить изображение из сети (делаем это в ассинхроном, что бы не заморозить UI)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                // обновляем UI (устанвливаем изображение) в основном потоке
                DispatchQueue.main.async {
                    self.flickrImages.image = UIImage(data: data!)
                }
            }
            
            name.text = safeRocketData.name
            
            heightValue.text = String(safeRocketData.height.meters)
            height.text = "Высота, ft"
            diameterValue.text = String(safeRocketData.diameter.meters)
            diameter.text = "Диаметр, ft"
            massValue.text = String(safeRocketData.mass.kg)
            mass.text = "Масса, lb"
            payloadWeightsValue.text = String(safeRocketData.payload_weights[0].kg)
            payloadWeights.text = "Нагрузка, lb"
            
            firstFlightValue.text = String(safeRocketData.first_flight)
            countryValue.text = String(safeRocketData.country)
            costPerLaunchValue.text = String(safeRocketData.cost_per_launch)
            
            enginesFirstValue.text = String(safeRocketData.first_stage.engines)
            fuelAmountTonsFirstValue.text = String(safeRocketData.first_stage.fuel_amount_tons)
            if let burn_time_sec = safeRocketData.first_stage.burn_time_sec {
                burnTimeSecFirstValue.text = String(burn_time_sec)
            } else {
                burnTimeSecFirstValue.text = "-"
            }
            
            enginesSecondValue.text = String(safeRocketData.second_stage.engines)
            fuelAmountTonsSecondValue.text = String(safeRocketData.second_stage.fuel_amount_tons)
            if let burn_time_sec = safeRocketData.second_stage.burn_time_sec {
                burnTimeSecSecondValue.text = String(burn_time_sec)
            } else {
                burnTimeSecSecondValue.text = "-"
            }
        }
    }
    
}
