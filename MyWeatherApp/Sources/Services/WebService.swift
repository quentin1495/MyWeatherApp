//
//  WebService.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import Alamofire

protocol WebServiceType {
    /// Request API with router
    /// - Parameter route: Router Enum
    func requestAPI(for route: Router, completion: @escaping (Data?, Error?) -> Void)
}

class WebService: WebServiceType {
    // MARK: Properties
    static let shared = WebService()

    func requestAPI(for router: Router, completion: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(router).response { response in
            completion(response.data, response.error)
        }
    }
}
