//
//  MockForecastService.swift
//  MyWeatherAppTests
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

@testable import MyWeatherApp
import Foundation

class MockForecastService: ForecastServiceType {
    func get(completion: @escaping (List?, Error?) -> Void) {
        let main = Weather(description: "Grand soleil", icon: "icon1")
        let details = Details(temperature: 5.0, humidity: 6.0)
        let wind = Wind(speed: 20.0)
        let date = 13255566.0
        let forecast = Forecast(weathers: [main], details: details, wind: wind, date: date, imageData: nil)
        let list = List(forecasts: [forecast])
        completion(list, nil)
    }
}
