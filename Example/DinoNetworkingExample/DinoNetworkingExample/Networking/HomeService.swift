//
//  HomeService.swift
//  DinoNetworkingExample
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import DinoNetworking
import Foundation

protocol HomeServiceProtocol {
    func fetch(completionHandler: @escaping (ResultResponse<HomeResponse>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }

    // MARK: - HomeServiceProtocol Functions

    func fetch(completionHandler: @escaping (ResultResponse<HomeResponse>) -> Void) {
        networkRequester.doRequest(request: HomeRequest.fetch, completionHandler: completionHandler)
    }
}
