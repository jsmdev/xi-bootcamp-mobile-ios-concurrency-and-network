//
//  DiscourseClientRemoteDataManagerImpl.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Implementación por defecto del protocolo remoto, en este caso usando SessionAPI
class DiscourseClientRemoteDataManagerImpl: DiscourseClientRemoteDataManager {
    let session: SessionAPI

    init(session: SessionAPI) {
        self.session = session
    }

    // MARK: - Topics
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        let request = LatestTopicsRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }

    func fetchTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ()) {
        let request = SingleTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }

    func addTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ()) {
        let request = CreateTopicRequest(title: title, raw: raw, createdAt: createdAt)
        session.send(request: request) { result in
            completion(result)
        }
    }

    func deleteTopic(id: Int, completion: @escaping (Result<VoidResponse?, Error>) -> ()) {
        let request = DeleteSingleTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }

    // MARK: - Categories
    func fetchAllCategories(completion: @escaping (Result<GetCategoriesResponse?, Error>) -> ()) {
        let request = GetCategoriesRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }

    // MARK: - Users
    func fetchAllUsers(completion: @escaping (Result<LatestUsersResponse?, Error>) -> ()) {
        let request = LatestUsersRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }

    func fetchUser(id: Int, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        let request = SingleUserRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }
}
