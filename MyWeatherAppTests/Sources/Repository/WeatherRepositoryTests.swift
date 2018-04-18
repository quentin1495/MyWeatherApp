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
        coreDataStack = CoreDataStack()
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
}
