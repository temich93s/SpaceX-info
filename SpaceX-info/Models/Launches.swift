//
//  Launches.swift
//  SpaceX-info
//
//  Created by 2lup on 29.08.2022.
//

import Foundation

struct Launches: Codable {
    let rocket: String
    let success: Bool?
    let name: String
    let date_utc: String
}
