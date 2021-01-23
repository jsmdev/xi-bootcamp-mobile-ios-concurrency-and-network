//
//  GetCategoriesResponse.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct GetCategoriesResponse: Codable {
    var categoryList: CategoryList

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

struct CategoryList: Codable {
    var categories: [Category] = []
}

struct Category: Codable {
    let id: Int
    let name, description: String

    enum CodingKeys: String, CodingKey {
        case id, name,description
    }
}
