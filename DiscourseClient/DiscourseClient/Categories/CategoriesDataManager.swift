//
//  CategoriesDataManager.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// Data Manager con las operaciones necesarias de este módulo
protocol CategoriesDataManager {
    func fetchAllCategories(completion: @escaping (Result<GetCategoriesResponse?, Error>) -> ())
}
