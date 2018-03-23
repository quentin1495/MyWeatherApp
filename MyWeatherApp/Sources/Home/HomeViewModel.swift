//
//  HomeViewModel.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// Home ViewModel
class HomeViewModel {
    // MARK: Initializers
    init(weathers: NSFetchedResultsController<WeatherEntity>) {
        self.dataSource = weathers
    }
    // MARK: - Outputs

    var dataSource: NSFetchedResultsController<WeatherEntity>
    var isSelected = false
    var tableViewDidSelectRowAt: ((_ indexPath: IndexPath) -> Void)?

    // MARK: - Inputs

    func tableViewDidSelectRow(at indexPath: IndexPath) {
        isSelected = true
        DispatchQueue.main.async {
            self.tableViewDidSelectRowAt?(indexPath)
        }
    }
}
