//
//  LatestResponse.swift
//  DiscourseClient
//
//  Created by José Sancho on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct LatestResponse: Codable {
    let users: [User]
    let topics: LatestTopicsResponse

    enum CodingKeys: String, CodingKey {
        case users
        case topics = "topic_list"
    }
}
