//
//  HomeRequest.swift
//  DinoNetworkingExample
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import DinoNetworking
import Foundation

enum HomeRequest {
    case fetch
}

extension HomeRequest: APIRequest {

    var path: APIPath {
        switch self {
        case .fetch: return Paths.news
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .fetch:
            return [URLQueryItem(name: "apiKey", value: Constants.API_KEY),
                    URLQueryItem(name: "domains", value: Constants.PUBLIC_DOMAINS)]
        }
    }
}
