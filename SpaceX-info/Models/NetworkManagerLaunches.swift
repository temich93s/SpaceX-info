//
//  NetworkManagerLaunches.swift
//  SpaceX-info
//
//  Created by 2lup on 29.08.2022.
//

import Foundation

struct NetworkManagerLaunches {
    
    var delegate: NetworkManagerLaunchesDelegate?
    
    func performRequest() -> [Launches]? {
        var launchesData: [Launches]?
        
        if let url = URL(string: "https://api.spacexdata.com/v4/launches") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            // Если нам приходит массив данных, то тогда тип тоже мы указываем в массиве [Rockets], а не просто Rockets
                            launchesData = try decoder.decode([Launches].self, from: safeData)
                            DispatchQueue.main.async {
                                delegate?.didUpdateLaunchesData(self, launches: launchesData)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        return launchesData
    }
}

protocol NetworkManagerLaunchesDelegate {
    func didUpdateLaunchesData(_ networkManager: NetworkManagerLaunches, launches: [Launches]?)
}
