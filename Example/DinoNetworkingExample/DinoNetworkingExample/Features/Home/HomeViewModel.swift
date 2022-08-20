//  HomeViewModel.swift
//  DinoNetworkingExample
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import DinoNetworking
import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    private var service: HomeServiceProtocol

    // MARK: - Lifecycle

    init(_ service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    // MARK: - Helpers
    
    func fetchArticles() {
        service.fetch(completionHandler: { [weak self] result in
            guard self != nil else { return }

            switch result {
            case let .success(response):
                print("Success - Article count: ", response.articles.count)
                if let first = response.articles.first {
                    print("Success - First title: ", first.title)
                }
            case let .failure(error):
                print("Failure: ", error.message ?? "")
            }
        })
    }
}
