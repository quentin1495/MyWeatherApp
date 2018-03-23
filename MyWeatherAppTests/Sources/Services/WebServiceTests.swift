//
//  WebServiceTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 03/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest

class WebServiceTests: XCTestCase {
    // MARK: Properties
    var data: Data?

    func testGivenAGoodRouteForJSON_whenRequest_ItGiveNotNilData() {
        let router = Router.forecast(city: .paris, units: .celsius, language: .french)

        WebService.shared.requestAPI(for: router) { data, _ in
            self.data = data
        }

        let predicate = NSPredicate(format: "data != nil")
        let expect = expectation(for: predicate, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [expect], timeout: 5.0)
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(data)
        } else {
            XCTAssert(false)
        }
    }

}
