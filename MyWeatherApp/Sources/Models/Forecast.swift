//
//  CurrentWeather.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    var weathers: [Weather]
    var details: Details?
    var wind: Wind?
    var date: Double?
    var imageData: Data?

    private enum CodingKeys: String, CodingKey {
        case details = "main"
        case weathers = "weather"
        case wind
        case date = "dt"
        case imageData
    }
}
