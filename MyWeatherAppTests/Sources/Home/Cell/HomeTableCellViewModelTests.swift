//
//  HomeTableCellViewModelTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 09/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest

class HomeTableCellViewModelTests: XCTestCase {
    // MARK: Properties
    let coreDataStack = MockCoreDataStack()

    func testWhenViewModelIsSet_dataSourceIsSet() {
        let weatherEntity = WeatherEntity(context: coreDataStack.persistentContainer.viewContext)
        weatherEntity.titleDescription = "Big sun"
        let viewModel = HomeTableCellViewModel(weather: weatherEntity)
        XCTAssertEqual(viewModel.dataSource.titleDescription, "Big sun")
    }
}
