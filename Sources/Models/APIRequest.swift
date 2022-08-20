//
//  APIRequest.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

#if os(iOS)

import Foundation

public protocol APIRequest {
    var baseURL: URL? { get }
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var params: Any? { get }
    var timeoutInterval: TimeInterval { get }
}

public extension APIRequest {
    // Default values
    var baseURL: URL? { nil }
    var method: HTTPMethod { .get }
    var queryItems: [URLQueryItem]? { nil }
    var params: Any? { nil }
    var timeoutInterval: TimeInterval { 10.0 }
}

#endif
