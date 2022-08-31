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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    var launchesData: [Launches]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CharacteristicRocketCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCharacteristicRocket")
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDataOnUI()
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SpaceRocketInfoToLaunches" else { return }
        guard let destination = segue.destination as? LaunchesViewController else { return }
        destination.launchesData = launchesData
        destination.rocketData = rocketData
    }
    
    @IBAction func settingButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SpaceRocketInfoToSetting", sender: self)
    }
    
    @IBAction func watchLaunch(_ sender: UIButton) {
        performSegue(withIdentifier: "SpaceRocketInfoToLaunches", sender: self)
    }
    
    func setUI() {
        watchLaunchButton.layer.cornerRadius = watchLaunchButton.frame.height / 4
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func setDataOnUI() {
        if let safeRocketData = rocketData {
            
            // Изображение ракеты
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
            
            // Наименование ракеты
            name.text = safeRocketData.name
            
            // Первый запуск, Страна, Стоимость запуска
            firstFlightValue.text = String(safeRocketData.first_flight)
            countryValue.text = String(safeRocketData.country)
            costPerLaunchValue.text = String(safeRocketData.cost_per_launch) + "$"
            
            // Первая степень
            enginesFirstValue.text = String(safeRocketData.first_stage.engines)
            fuelAmountTonsFirstValue.text = String(safeRocketData.first_stage.fuel_amount_tons)
            if let burn_time_sec = safeRocketData.first_stage.burn_time_sec {
                burnTimeSecFirstValue.text = String(burn_time_sec)
            } else {
                burnTimeSecFirstValue.text = "-"
            }
            
            // Вторая ступень
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

extension SpaceRocketInfoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCharacteristicRocket", for: indexPath) as! CharacteristicRocketCollectionViewCell
        
        cell.characteristicRocketView.layer.cornerRadius = cell.characteristicRocketView.frame.height / 4
        
        if let safeRocketData = rocketData {
            switch indexPath.row {
            case 0:
                if ScaleOfNotation.heightScale == "m" {
                    cell.value.text = String(safeRocketData.height.meters)
                } else if ScaleOfNotation.heightScale == "ft" {
                    cell.value.text = String(safeRocketData.height.feet)
                }
                cell.characteristic.text = "Высота, \(ScaleOfNotation.heightScale)"
            case 1:
                if ScaleOfNotation.diameterScale == "m" {
                    cell.value.text = String(safeRocketData.diameter.meters)
                } else if ScaleOfNotation.diameterScale == "ft" {
                    cell.value.text = String(safeRocketData.diameter.feet)
                }
                cell.characteristic.text = "Диаметр, \(ScaleOfNotation.diameterScale)"
            case 2:
                if ScaleOfNotation.massScale == "kg" {
                    cell.value.text = String(safeRocketData.mass.kg)
                } else if ScaleOfNotation.massScale == "lb" {
                    cell.value.text = String(safeRocketData.mass.lb)
                }
                cell.characteristic.text = "Масса, \(ScaleOfNotation.massScale)"
            case 3:
                if ScaleOfNotation.payloadWeightsScale == "kg" {
                    cell.value.text = String(safeRocketData.payload_weights[0].kg)
                } else if ScaleOfNotation.payloadWeightsScale == "lb" {
                    cell.value.text = String(safeRocketData.payload_weights[0].lb)
                }
                cell.characteristic.text = "Нагрузка, \(ScaleOfNotation.payloadWeightsScale)"
            default: break
            }
        }
        return cell
    }
    
    
}
