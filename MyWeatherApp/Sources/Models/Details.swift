//
//  Details.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

struct Details: Codable {
    var temperature: Double?
    var humidity: Double?
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
    }
}
