//
//  List.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 08/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

struct List: Codable {
    var forecasts: [Forecast]
    private enum CodingKeys: String, CodingKey {
        case forecasts = "list"
    }
}
