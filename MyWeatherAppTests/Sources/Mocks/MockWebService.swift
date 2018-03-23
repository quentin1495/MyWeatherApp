//
//  MockWebService.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//
@testable import MyWeatherApp
import Foundation

class MockWebService: WebServiceType {
    // MARK: Properties
    static let shared = MockWebService()
    private let forecastJSONFileName = "forecast"
    private let imagePNGFileName = "02n"

    func requestAPI(for route: Router, completion: @escaping (Data?, Error?) -> Void) {
        guard let path = getURLPath(for: route) else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            completion(data, nil)
        } catch {
            completion(nil, error)
        }
    }

    // MARK: - Private functions

    private func getURLPath(for route: Router) -> String? {
        let bundle = Bundle(for: type(of: self))
        switch route {
        case .forecast:
            let path = bundle.path(forResource: forecastJSONFileName, ofType: "json")
            return path
        case .image:
            let path = bundle.path(forResource: imagePNGFileName, ofType: "png")
            return path
        }
    }
}
