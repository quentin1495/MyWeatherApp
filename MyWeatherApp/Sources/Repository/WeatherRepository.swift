//
//  WeatherRepository.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class WeatherRepository {
    // MARK: Properties
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack

    // MARK: Initializers
    init(managedObjectContext: NSManagedObjectContext = CoreDataStack.shared.mainContext,
         coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }

     ///Insert forecast object in Core Data
     ///- parameter forecast:   Valid forecast object
    public func addForecast(_ forecast: Forecast) {
        guard let timeInterval = forecast.date, let temperature = forecast.details?.temperature,
            let humidity = forecast.details?.humidity, let windSpeed = forecast.wind?.speed,
            let description = forecast.weathers[0].description else {
                return
        }
        let date = Date(timeIntervalSince1970: timeInterval)
        guard fetch(with: .duplicity(forDate: date))?.fetchedObjects?.count == 0 else {
            return
        }

        let weather = WeatherEntity(context: managedObjectContext)
        weather.date = date
        weather.humidity = humidity
        weather.temperature = temperature
        weather.titleDescription = description
        weather.windSpeed = windSpeed
        weather.hour = date.getHourInString
        weather.day = date.getDayInString
        weather.image = forecast.imageData
        weather.stringDate = date.getDateInString

        if managedObjectContext.hasChanges {
            coreDataStack.saveContext(managedObjectContext)
        }
    }

    /// Fetch Core data with filtrer
    /// - Parameter filter: SearchFilter enum
    /// - Returns: NSFetchedResultsController<WeatherEntity>?
    func fetch(with filter: SearchFiltrer) -> NSFetchedResultsController<WeatherEntity>? {
        let fetchRequest = WeatherEntity.fetchRequest() as NSFetchRequest<WeatherEntity>
        let predict = filter.predicate
        fetchRequest.predicate = predict
        let descriptor = NSSortDescriptor(key: #keyPath(WeatherEntity.date), ascending: true)
        fetchRequest.sortDescriptors = [descriptor]

        let weathers = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        do {
            try weathers.performFetch()
            return weathers
        } catch {
            return nil
        }
    }
}
