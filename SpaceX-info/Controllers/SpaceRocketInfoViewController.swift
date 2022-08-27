//
//  SpaceRocketInfoViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import UIKit

class SpaceRocketInfoViewController: UIPageViewController {

    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkManager = NetworkManager()
        var rocketsData: [Rockets]?
        rocketsData = networkManager.performRequest()
        print(rocketsData)
        
        switch index {
        case 0: view.backgroundColor = UIColor.blue
        case 1: view.backgroundColor = UIColor.green
        case 2: view.backgroundColor = UIColor.yellow
        case 3: view.backgroundColor = UIColor.orange
        default: view.backgroundColor = UIColor.gray
        }
    }

}
