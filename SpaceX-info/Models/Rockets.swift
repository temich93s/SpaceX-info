//
//  Rockets.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import Foundation

struct Rockets: Codable {
    let name: String
    let first_flight: String
    let country: String
    let cost_per_launch: Int
    let flickr_images: [String]
    let height, diameter: Size
    let mass: Weight
    let payload_weights: [PlayloadWeight]
}

struct Size: Codable {
    let meters: Float
    let feet: Float
}

struct Weight: Codable {
    let kg: Int
    let lb: Int
}

struct PlayloadWeight: Codable {
    let kg: Int
    let lb: Int
}

