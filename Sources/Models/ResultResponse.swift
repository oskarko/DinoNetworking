//
//  ResultResponse.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

#if os(iOS)

import Foundation

public enum ResultResponse<T> {
    case success(T)
    case failure(APIErrorResponse)
}

#endif
