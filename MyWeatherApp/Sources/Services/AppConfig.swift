//
//  AppConfig.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 19/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import UIKit

class AppConfig {
    // MARK: Properties
    private var weatherRepository: WeatherRepository
    private var imageService: ImageServiceType
    private var forecastService: ForecastServiceType

    // MARK: Initializers
    init(weatherRepository: WeatherRepository = WeatherRepository(),
         imageService: ImageServiceType = ImageService(),
         forecastService: ForecastServiceType = ForecastService()
        ) {
        self.weatherRepository = weatherRepository
        self.imageService = imageService
        self.forecastService = forecastService
    }

    /// Refresh database from API
    func start() {
        forecastService.get { data, _ in
            guard let data = data else { return }
            data.forecasts.forEach { forecast in
                var workingForecast = forecast
                self.imageService.get(for: Router.image(iconName: forecast.weathers[0].icon ?? "")) { image, _ in
                    guard let image = image, let data = image.pngData() else {
                        return
                    }
                    workingForecast.imageData = data
                    _ = self.weatherRepository.addForecast(workingForecast)
                }
            }
        }
    }
}
