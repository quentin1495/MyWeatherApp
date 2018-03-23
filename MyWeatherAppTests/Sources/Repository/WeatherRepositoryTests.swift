//
//  WeatherRepositoryTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 03/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest
import Foundation

class WeatherRepositoryTests: XCTestCase {
    // MARK: Properties
    var coreDataStack: CoreDataStack!
    var weatherRepository: WeatherRepository!

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        weatherRepository = WeatherRepository(
            managedObjectContext: coreDataStack.mainContext,
            coreDataStack: coreDataStack)
    }

    override func tearDown() {
        super.tearDown()
        coreDataStack = nil
        weatherRepository = nil
    }

    func testWhenIfetchWeatherFromCoreData_itsReturnData() {
        let weathers = weatherRepository.fetch(with: .list)

        XCTAssertNotNil(weathers)
    }

    func testGivenAValidWeather_whenAddForecast_itsSaved() {
        let context = coreDataStack.newDerivedContext()
        weatherRepository = WeatherRepository(managedObjectContext: context, coreDataStack: coreDataStack)
        let main = Weather(description: "Pluie", icon: "icon")
        let details = Details(temperature: 5.0, humidity: 1.0)
        let wind = Wind(speed: 5.0)
        let date = 557815.0
        let forecast = Forecast(weathers: [main], details: details, wind: wind, date: date, imageData: Data())

        expectation(forNotification: .NSManagedObjectContextDidSave, object: coreDataStack.mainContext)

        self.weatherRepository.addForecast(forecast)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertNil(error, "Save did not occur")
        }
    }

}
