//
//  APIErrorResponse.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

#if os(iOS)

import Foundation

public struct APIErrorResponse: Codable {
    public var code: String?
    public var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case message
    }

    public init(code: String? = nil,
         message: String? = nil)
    {
        self.code = code
        self.message = message
    }

    public static let badURL = APIErrorResponse(message: NSLocalizedString("Bad URL format", comment: ""))
    public static let invalidData = APIErrorResponse(message: NSLocalizedString("Invalid data", comment: ""))
    public static let invalidJSON = APIErrorResponse(message: NSLocalizedString("The server response did not match our model", comment: ""))
}

#endif
