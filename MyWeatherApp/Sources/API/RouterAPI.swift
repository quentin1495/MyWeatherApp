//
//  RouterAPI.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import Alamofire

enum Units: String {
    case fahrenheit = "imperial"
    case celsius = "metric"
}

enum Language: String {
    case english = "en"
    case french = "fr"
}

enum City: Int {
    case paris = 2988507
}

enum Router: URLRequestConvertible {

    case forecast(city: City, units: Units, language: Language)
    case image(iconName: String)

    fileprivate static let baseURLString = "http://api.openweathermap.org"
    fileprivate static let apiKey = "d6f3ef3c58c3bede9835a9dcfbff3944"

    fileprivate var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        case .image:
            return .get
        }
    }

    fileprivate var path: String {
        switch self {
        case .forecast:
            return "/data/2.5/forecast"
        case .image(let name):
            return "/img/w/\(name).png"
        }
    }

    fileprivate var parameters: Parameters {
        switch self {
        case .image:
            return [:]
        case .forecast(let city, let units, let language):
            return ["id": city.rawValue, "units": units.rawValue, "lang": language.rawValue,
                    "appid": Router.apiKey, "cnt": Constant.maxHourDisplayedNumber]
        }
    }

    // MARK: URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .image:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .forecast:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}
