//
//  LaunchesViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 29.08.2022.
//

import UIKit

class LaunchesViewController: UIViewController {

    var rocketData: Rocket?
    var launchesData: [Launches]?
    
    private var launcesDataForCurrentRocket: [Launches]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LaunchesTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableLaunchesCell")
        
        launcesDataForCurrentRocket = launchesData?.filter({ $0.rocket == rocketData?.id})
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

}

extension LaunchesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let safeLauncesDataForCurrentRocket = launcesDataForCurrentRocket {
            return safeLauncesDataForCurrentRocket.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableLaunchesCell", for: indexPath) as! LaunchesTableViewCell
        if let safeLauncesDataForCurrentRocket = launcesDataForCurrentRocket {
            cell.nameLaunch.text = safeLauncesDataForCurrentRocket[indexPath.row].name
            cell.dataLaunch.text = safeLauncesDataForCurrentRocket[indexPath.row].date_utc
            if let safeSuccess = safeLauncesDataForCurrentRocket[indexPath.row].success {
                if safeSuccess {
                    cell.successLaunch.image = UIImage(systemName: "checkmark.square")
                    cell.successLaunch.tintColor = UIColor.green
                } else {
                    cell.successLaunch.image = UIImage(systemName: "xmark.square")
                    cell.successLaunch.tintColor = UIColor.red
                }
            } else {
                cell.successLaunch.image = UIImage(systemName: "questionmark.square")
                cell.successLaunch.tintColor = UIColor.gray
            }
        }
        return cell
    }
    
    
}
