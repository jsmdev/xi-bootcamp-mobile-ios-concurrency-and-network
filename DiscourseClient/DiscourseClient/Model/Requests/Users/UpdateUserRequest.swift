//
//  UpdateUserRequest.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UpdateUserRequest: APIRequest {

    typealias Response = SingleUserResponse

    let username: String
    let name: String

    init(username: String, name: String) {
        self.username = username
        self.name = name
    }

    var method: Method {
        return .PUT
    }

    var path: String {
        return "/users/\(username).json"
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: [String : Any] {
        return ["name": self.name]
    }

    var headers: [String : String] {
        return [:]
    }
}
