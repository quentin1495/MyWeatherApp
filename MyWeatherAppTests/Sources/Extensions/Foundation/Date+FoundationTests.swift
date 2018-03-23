//
//  Date+FoundationTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest

class DateFoundationTests: XCTestCase {
    // MARK: Properties
    private var date: Date {
        let date = Date(timeIntervalSince1970: 1520143680) // 03/04/2018 @ 7:08am (UTC)
        return date
    }

    func testGivenAnHourInStringFromDate_itReturnsCorrectHour() {
        let hour = date.getHourInString

        XCTAssertEqual(hour, "6")
    }

    func testGivenAnHourInStringFromDate_itReturnsCompleteCorrectHour() {
        let hourInString = date.getcompleteHourInString

        XCTAssertEqual(hourInString, "06 AM")
    }

    func testGivenAnDayInStringFromDate_itReturnsCorrectDay() {
        let day = date.getDayInString

        XCTAssertEqual(day, "Sunday")
    }

    func testGivenAnDayInStringFromDate_itReturnsCorrectDate() {
        let day = date.getDateInString

        XCTAssertEqual(day, "2018/03/04")
    }
}
