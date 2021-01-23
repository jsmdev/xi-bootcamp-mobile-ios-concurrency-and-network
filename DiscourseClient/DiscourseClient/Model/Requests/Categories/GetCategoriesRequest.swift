//
//  GetCategoriesRequest.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// Implementación de la request que obtiene las categories
struct GetCategoriesRequest: APIRequest {

    typealias Response = GetCategoriesResponse

    var method: Method {
        return .GET
    }

    var path: String {
        return "/categories.json"
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: [String : Any] {
        return [:]
    }

    var headers: [String : String] {
        return [:]
    }

}
