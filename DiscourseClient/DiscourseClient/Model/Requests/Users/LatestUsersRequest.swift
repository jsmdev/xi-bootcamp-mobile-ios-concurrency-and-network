//
//  LatestTopicsRequest.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

/// Implementación de la request que obtiene los latest users
struct LatestUsersRequest: APIRequest {
    typealias Response = LatestUsersResponse

    let period = "all"
    let order = "topic_count"

    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return ["period": period, "order": order]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }

}
