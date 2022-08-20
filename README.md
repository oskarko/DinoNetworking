# DinoNetworking

## Installation

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/oskarko/DinoNetworking.git`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/oskarko/DinoNetworking.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

You have to create 4 different files:

### Paths file

```swift

import DinoNetworking
import Foundation

public enum Paths: APIPath {
    case example
    
    public var rawValue: String {
        switch self {
        case .example: return "/v2/everything"
        }
    }
}

public extension APIRequest {
    // Default base URL value
    var baseURL: URL? {
        return URL(string: "https://newsapi.org")
    }
}

```

### Service file

```swift

import DinoNetworking
import Foundation

protocol ExampleServiceProtocol {
    func fetch(completionHandler: @escaping (ResultResponse<ExampleResponse>) -> Void)
}

final class ExampleService: ExampleServiceProtocol {
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }

    // MARK: - ExampleServiceProtocol Functions

    func fetch(completionHandler: @escaping (ResultResponse<ExampleResponse>) -> Void) {
        let request = ExampleRequest.fetch
        networkRequester.doRequest(request: request, completionHandler: completionHandler)
    }
}

```

### Request file

```swift

import DinoNetworking
import Foundation

enum ExampleRequest {
    case fetch
}

extension ExampleRequest: APIRequest {

    var path: APIPath {
        switch self {
        case .fetch: return .example
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .fetch:
            return [URLQueryItem(name: "apiKey", value: Constants.API_KEY)]
        }
    }
}

```

### Response file

```swift

import Foundation

struct ExampleResponse: Codable {
    let status: String
    let items: [ExampleItem]
    
    enum CodingKeys: String, CodingKey {
        case status
        case items
    }
}

struct ExampleItem: Codable {
    let source: Source
    let title: String
    let description: String
    let urlToImage: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case description
        case urlToImage
        case publishedAt
    }
}

```
