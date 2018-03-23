//
//  DetailsTableCellViewModel.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 09/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest

class DetailsTableCellViewModelTests: XCTestCase {
    // MARK: Properties
    let coreDataStack = MockCoreDataStack()

    func testWhenViewModelIsSet_dataSourceIsSet() {
        let weatherEntity = WeatherEntity(context: coreDataStack.persistentContainer.viewContext)
        weatherEntity.temperature = 10.0
        let viewModel = DetailsTableCellViewModel(weather: weatherEntity)
        XCTAssertEqual(viewModel.dataSource.temperature, 10.0)
    }
}
