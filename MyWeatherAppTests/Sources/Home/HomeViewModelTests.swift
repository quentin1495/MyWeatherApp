//
//  MyWeatherAppTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest
import CoreData
import UIKit

class HomeViewModelTests: XCTestCase {
    // MARK: Properties
    var coreDataStack: CoreDataStack!
    var weatherRepository: WeatherRepository!

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        weatherRepository = WeatherRepository(coreDataStack: coreDataStack)
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
        let viewModel = HomeViewModel(weathers: weathers)
        XCTAssertNotNil(viewModel.dataSource.fetchedObjects)
    }

    func testWhenCellIsClicked_didSelectClosureReturnTheEvent() {
        let expect = expectation(description: "event")
        let weathersFetched = weatherRepository.fetch(with: .all)
        let testIndexPath = IndexPath(row: 0, section: 0)
        guard let weathers = weathersFetched else {
            XCTAssert(false)
            return
        }
        let viewModel = HomeViewModel(weathers: weathers)
        viewModel.tableViewDidSelectRow(at: testIndexPath)
        viewModel.tableViewDidSelectRowAt = { indexPath in
            XCTAssertEqual(indexPath, testIndexPath)
            expect.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
