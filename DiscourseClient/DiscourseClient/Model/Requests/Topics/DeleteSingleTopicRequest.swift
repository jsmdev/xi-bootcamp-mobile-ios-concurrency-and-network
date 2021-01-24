//
//  DeleteSingleTopicRequest.swift
//  DiscourseClient
//
//  Created by José Sancho on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct DeleteSingleTopicRequest: APIRequest {
    typealias Response = VoidResponse

    let id: Int

    init(id: Int) {
        self.id = id
    }

    var method: Method {
        return .DELETE
    }

    var path: String {
        return "/t/\(id).json"
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
