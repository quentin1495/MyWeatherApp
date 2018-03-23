//
//  ImageServiceTests.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import XCTest
import UIKit

class ImageServiceTests: XCTestCase {
    // MARK: Properties
    var webService: WebServiceType!
    var imageService: ImageServiceType!

    override func setUp() {
        super.setUp()
        let webService = MockWebService()
        self.webService = webService
        let imageService = ImageService(webService: webService)
        self.imageService = imageService
    }
    func testGivenAnImageRoute_itCompletionReturnErrorNilAndImageNotNil_thenWaitEvent() {
        let route = Router.image(iconName: "")
        let expect = expectation(description: "event")

        imageService.get(for: route) { image, error in
            XCTAssertNil(error)
            XCTAssertNotNil(image)
            expect.fulfill()
        }

        waitForExpectations(timeout: 2.0, handler: nil)
    }
}
