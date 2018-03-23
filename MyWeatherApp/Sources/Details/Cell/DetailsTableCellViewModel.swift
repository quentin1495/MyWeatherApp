//
//  DetailsTableCellModel.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 07/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

class DetailsTableCellViewModel {
    // MARK: Initializers
    init(weather: WeatherEntity) {
        self.dataSource = weather
    }
    // MARK: - Outputs

    var dataSource: WeatherEntity
}
