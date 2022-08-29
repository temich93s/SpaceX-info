//
//  SettingViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 28.08.2022.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableSettingCell")
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableSettingCell", for: indexPath) as! SettingTableViewCell
    
        cell.indexCell = indexPath.row
        
        let font = UIFont.systemFont(ofSize: 22)
        cell.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        switch cell.indexCell {
        case 0:
            if indexPath.row == 0 {
                cell.label.text = "Высота"
            } else {
                cell.label.text = "Диаметр"
            }
            cell.segmentedControl.setTitle("m", forSegmentAt: 0)
            cell.segmentedControl.setTitle("ft", forSegmentAt: 1)
            if ScaleOfNotation.heightScale == "m" {
                cell.segmentedControl.selectedSegmentIndex = 0
            } else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
        case 1:
            if indexPath.row == 0 {
                cell.label.text = "Высота"
            } else {
                cell.label.text = "Диаметр"
            }
            cell.segmentedControl.setTitle("m", forSegmentAt: 0)
            cell.segmentedControl.setTitle("ft", forSegmentAt: 1)
            if ScaleOfNotation.diameterScale == "m" {
                cell.segmentedControl.selectedSegmentIndex = 0
            } else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
        case 2:
            if indexPath.row == 2 {
                cell.label.text = "Масса"
            } else {
                cell.label.text = "Полезная нагрузка"
            }
            cell.segmentedControl.setTitle("kg", forSegmentAt: 0)
            cell.segmentedControl.setTitle("lb", forSegmentAt: 1)
            if ScaleOfNotation.massScale == "kg" {
                cell.segmentedControl.selectedSegmentIndex = 0
            } else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
        case 3:
            if indexPath.row == 2 {
                cell.label.text = "Масса"
            } else {
                cell.label.text = "Полезная нагрузка"
            }
            cell.segmentedControl.setTitle("kg", forSegmentAt: 0)
            cell.segmentedControl.setTitle("lb", forSegmentAt: 1)
            if ScaleOfNotation.payloadWeightsScale == "kg" {
                cell.segmentedControl.selectedSegmentIndex = 0
            } else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
        default:
            break
        }
        
        return cell
    }
    
}
