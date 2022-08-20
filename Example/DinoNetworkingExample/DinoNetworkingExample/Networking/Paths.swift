//
//  Paths.swift
//  DinoNetworkingExample
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import DinoNetworking
import Foundation

public enum Paths: APIPath {
    case news
    
    public var rawValue: String {
        switch self {
        case .news: return "/v2/everything"
        }
    }
}

public extension APIRequest {
    // Default base URL value
    var baseURL: URL? {
        return URL(string: "https://newsapi.org")
    }
}
