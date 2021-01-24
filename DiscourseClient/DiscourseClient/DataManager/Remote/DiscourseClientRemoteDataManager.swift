//
//  DiscourseClientRemoteDataManager.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Protocolo que contiene todas las llamadas remotas de la app
protocol DiscourseClientRemoteDataManager {
    // MARK: - Topics
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
    func fetchTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ())
    func addTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ())
    func deleteTopic(id: Int, completion: @escaping (Result<VoidResponse?, Error>) -> ())
    // MARK: - Categories
    func fetchAllCategories(completion: @escaping (Result<GetCategoriesResponse?, Error>) -> ())
    // MARK: - Users
    func fetchAllUsers(completion: @escaping (Result<LatestUsersResponse?, Error>) -> ())
    func fetchUser(username: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ())
    func updateUser(username: String, name: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ())
}
