//
//  ImageService.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 04/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import UIKit

protocol ImageServiceType {
    /// Request to get image data
    /// - Parameter router: Api route (image probably)
    func get(for router: Router, completion: @escaping (UIImage?, Error?) -> Void)
}

class ImageService: ImageServiceType {
    // MARK: Properties
    let webService: WebServiceType

    // MARK: Initializers
    init(webService: WebServiceType = WebService.shared) {
        self.webService = webService
    }

    func get(for router: Router, completion: @escaping (UIImage?, Error?) -> Void) {
        webService.requestAPI(for: router) { data, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            let image = UIImage(data: data)
            completion(image, nil)
        }
    }
}
