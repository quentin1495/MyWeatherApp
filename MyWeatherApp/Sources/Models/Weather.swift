//
//  Main.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var description: String?
    var icon: String?
    private enum CodingKeys: String, CodingKey {
        case description
        case icon
    }
}
