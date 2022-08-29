//
//  NetworkManagerRockets.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import Foundation

struct NetworkManagerRockets {
    
    var delegate: NetworkManagerRocketsDelegate?
    
    func performRequest() -> [Rocket]? {
        var rocketsData: [Rocket]?
        
        if let url = URL(string: "https://api.spacexdata.com/v4/rockets") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            // Если нам приходит массив данных, то тогда тип тоже мы указываем в массиве [Rockets], а не просто Rockets
                            rocketsData = try decoder.decode([Rocket].self, from: safeData)
                            DispatchQueue.main.async {
                                delegate?.didUpdateRocketsData(self, rockets: rocketsData)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        return rocketsData
    }
}

protocol NetworkManagerRocketsDelegate {
    func didUpdateRocketsData(_ networkManager: NetworkManagerRockets, rockets: [Rocket]?)
}
