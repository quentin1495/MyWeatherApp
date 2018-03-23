//
//  DetailsViewModel.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 07/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest
import UIKit

class DetailsViewModelTests: XCTestCase {
    // MARK: Properties
    var coreDataStack: CoreDataStack!
    var weatherRepository: WeatherRepository!

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        weatherRepository = WeatherRepository(managedObjectContext: coreDataStack.mainContext,
                                              coreDataStack: coreDataStack)
    }

    override func tearDown() {
        super.tearDown()
        coreDataStack = nil
        weatherRepository = nil
    }

    func testWhenViewModelIsSet_dataSourceIsNotNil() {
        let weathersFetched = weatherRepository.fetch(with: .all)
        guard let weathers = weathersFetched else {
            XCTAssert(false)
            return
        }
        let viewModel = DetailsViewModel(weathers: weathers)
        XCTAssertNotNil(viewModel.dataSource.fetchedObjects)
    }
}
