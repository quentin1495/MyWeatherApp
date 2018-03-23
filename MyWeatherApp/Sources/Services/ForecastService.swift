//
//  ForecastService.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import UIKit

protocol ForecastServiceType {
    /// Get Forecast data
    /// parameter completion: List and Error
    func get(completion: @escaping (List?, Error?) -> Void)
}

class ForecastService: ForecastServiceType {
    // MARK: Properties
    private let jsonDecoder: JSONDecoder
    private let webService: WebServiceType
    private let imageService: ImageServiceType

    // MARK: Initializers
    init(service webService: WebServiceType = WebService.shared, imageService: ImageServiceType = ImageService()) {
        self.jsonDecoder = JSONDecoder()
        self.webService = webService
        self.imageService = imageService
    }

    func get(completion: @escaping (List?, Error?) -> Void) {
        let route = Router.forecast(city: .paris, units: .celsius, language: .english)
        webService.requestAPI(for: route) { forecasts, error in
            guard let forecasts = forecasts, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let list = try self.jsonDecoder.decode(List.self, from: forecasts)
                completion(list, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
