//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol UserDetailCoordinatorDelegate: class {
    func userDetailBackButtonTapped()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol UserDetailViewDelegate: class {
    func userDetailFetched()
    func errorFetchingUserDetail()
}

class UserDetailViewModel {
    var labelUserIDText: String?
    var labelUserNameText: String?
    var labelUserUsernameText: String?
//    var candEdit: Bool?

    weak var viewDelegate: UserDetailViewDelegate?
    weak var coordinatorDelegate: UserDetailCoordinatorDelegate?
    let userDetailDataManager: UserDetailDataManager
    let userID: Int

    init(userID: Int, userDetailDataManager: UserDetailDataManager) {
        self.userID = userID
        self.userDetailDataManager = userDetailDataManager
    }

    func viewDidLoad() {
        labelUserIDText = "\(self.userID)"
        self.viewDelegate?.userDetailFetched()
//        topicDetailDataManager.fetchTopic(id: self.topicID) { [weak self] result in
//            switch result {
//                case .success(let topicResponse):
//                    self?.labelTopicIDText = "\(topicResponse?.id ?? 0)"
//                    self?.labelTopicNameText = topicResponse?.title
//                    self?.labelPostsNumberText = "\(topicResponse?.postsCount ?? 0)"
//                    self?.candDelete = topicResponse?.details.canDelete
//                    self?.viewDelegate?.topicDetailFetched()
//                case .failure:
//                    self?.viewDelegate?.errorFetchingTopicDetail()
//            }
//        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.userDetailBackButtonTapped()
    }

    func editButtonTapped() {
//        topicDetailDataManager.deleteTopic(id: self.topicID) { [weak self] result in
//            switch result {
//                case .success:
//                    self?.coordinatorDelegate?.topicDeletedSuccessfully()
//                case .failure(let error):
//                    print(error)
//                    self?.viewDelegate?.errorDeletingTopic()
//            }
//        }
    }
}
