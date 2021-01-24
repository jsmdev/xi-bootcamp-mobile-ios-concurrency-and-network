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
    func userNameUpdated()
    func errorUpdatingUserName()
}

class UserDetailViewModel {
    var labelUserIDText: String?
    var labelUserNameText: String?
    var labelUserUsernameText: String?
    var candEditName: Bool?

    weak var viewDelegate: UserDetailViewDelegate?
    weak var coordinatorDelegate: UserDetailCoordinatorDelegate?
    let userDetailDataManager: UserDetailDataManager
    let username: String

    init(username: String, userDetailDataManager: UserDetailDataManager) {
        self.username = username
        self.userDetailDataManager = userDetailDataManager
    }

    func viewDidLoad() {
        userDetailDataManager.fetchUser(username: self.username) { [weak self] result in
            switch result {
                case .success(let userResponse):
                    self?.labelUserIDText = "\(userResponse?.user.id ?? 0)"
                    self?.labelUserNameText = userResponse?.user.name
                    self?.labelUserUsernameText = userResponse?.user.username
                    self?.candEditName = userResponse?.user.canEditName
                    self?.viewDelegate?.userDetailFetched()
                case .failure:
                    self?.viewDelegate?.errorFetchingUserDetail()
            }
        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.userDetailBackButtonTapped()
    }

    func updateNameTapped(name: String) {
        userDetailDataManager.updateUser(username: self.username, name: name) { [weak self] result in
            switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.viewDelegate?.userNameUpdated()
                    }
                case .failure(let error):
                    print("Error when updating name of user: \(error)")
                    DispatchQueue.main.async {
                        self?.viewDelegate?.errorUpdatingUserName()
                    }
            }
        }
    }
}
