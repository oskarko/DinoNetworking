//
//  NetworkRequest.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

#if os(iOS)

import Foundation

public struct NetworkRequest {
    var request: URLRequest

    init(apiRequest: APIRequest) {

        var urlComponents = URLComponents(
            string: apiRequest.baseURL?.description ?? ""
        )

        urlComponents?.path = apiRequest.path.rawValue
        urlComponents?.queryItems = apiRequest.queryItems

        guard let fullURL = urlComponents?.url else {
            assertionFailure("Couldn't build the URL. Did you check 👉 APIRequest.baseURL 👈 ?")
            self.request = URLRequest(url: URL(string: "")!)
            
            return
        }

        request = URLRequest(url: fullURL)
        request.httpMethod = apiRequest.method.rawValue
        request.timeoutInterval = apiRequest.timeoutInterval
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")

        if let params = apiRequest.params,
            apiRequest.method == .post || apiRequest.method == .patch {
            let jsonData = try! JSONSerialization.data(withJSONObject: params,
                                                       options: .prettyPrinted)
            request.httpBody = jsonData
        }
    }
}

#endif
