//
//  ForecastServiceTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//
@testable import MyWeatherApp
import XCTest

class ForecastServiceTests: XCTestCase {
    // MARK: Properties
    private var forecastService: ForecastServiceType!

    override func setUp() {
        super.setUp()
        let webService = MockWebService()
        let forecastService = ForecastService(service: webService)
        self.forecastService = forecastService
    }

    func testWhenIUseGet_ReturnNilErrorAndNotNillForecast_thenWaitEvent() {
        let expect = expectation(description: "event")
        forecastService.get { list, error in
            XCTAssertNil(error)
            XCTAssertNotNil(list)
            XCTAssertNotNil(list?.forecasts.first?.date)
            expect.fulfill()
        }

        waitForExpectations(timeout: 2.0, handler: nil)
    }
}
