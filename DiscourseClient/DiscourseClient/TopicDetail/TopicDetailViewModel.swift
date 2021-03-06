//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
    func topicDeletedSuccessfully()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func errorDeletingTopic()
}

class TopicDetailViewModel {
    var labelTopicIDText: String?
    var labelTopicNameText: String?
    var labelPostsNumberText: String?
    var candDelete: Bool?

    weak var viewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    let topicID: Int


    init(topicID: Int, topicDetailDataManager: TopicDetailDataManager) {
        self.topicID = topicID
        self.topicDetailDataManager = topicDetailDataManager
    }

    func viewDidLoad() {
        topicDetailDataManager.fetchTopic(id: self.topicID) { [weak self] result in
            switch result {
                case .success(let topicResponse):
                    self?.labelTopicIDText = "\(topicResponse?.id ?? 0)"
                    self?.labelTopicNameText = topicResponse?.title
                    self?.labelPostsNumberText = "\(topicResponse?.postsCount ?? 0)"
                    self?.candDelete = topicResponse?.details.canDelete
                    DispatchQueue.main.async {
                        self?.viewDelegate?.topicDetailFetched()
                    }
                case .failure:
                    DispatchQueue.main.async {
                        self?.viewDelegate?.errorFetchingTopicDetail()
                    }
            }
        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }

    func deleteButtonTapped() {
        topicDetailDataManager.deleteTopic(id: self.topicID) { [weak self] result in
            switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.coordinatorDelegate?.topicDeletedSuccessfully()
                    }
                case .failure(let error):
                    print("Error when deleting topic: \(error)")
                    DispatchQueue.main.async {
                        self?.viewDelegate?.errorDeletingTopic()
                    }
            }
        }
    }
}
