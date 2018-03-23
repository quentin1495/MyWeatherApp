//
//  DetailsViewModel.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 05/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DetailsViewModel {
    init(weathers: NSFetchedResultsController<WeatherEntity>) {
        self.dataSource = weathers
    }
    // MARK: - Inputs

    var dataSource: NSFetchedResultsController<WeatherEntity>
}
