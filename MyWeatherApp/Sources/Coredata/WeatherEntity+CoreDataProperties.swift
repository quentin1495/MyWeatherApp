//
//  WeatherEntity+CoreDataProperties.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 21/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//
//

import Foundation
import CoreData

extension WeatherEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
        return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var day: String?
    @NSManaged public var hour: String
    @NSManaged public var humidity: Double
    @NSManaged public var image: Data?
    @NSManaged public var temperature: Double
    @NSManaged public var titleDescription: String?
    @NSManaged public var windSpeed: Double
    @NSManaged public var stringDate: String?

}
