//
//  UsersDataManager.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// Errores que pueden darse en el topics data manager
enum UsersDataManagerError: Error {
    case unknown
}

/// Data Manager con las operaciones necesarias de este módulo
protocol UsersDataManager {
    func fetchAllUsers(completion: @escaping (Result<LatestUsersResponse?, Error>) -> ())
}
