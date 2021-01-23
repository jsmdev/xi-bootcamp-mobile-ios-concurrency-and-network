//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// ViewModel que representa un user en la lista
class UserCellViewModel {
    let user: User
    var nameLabelText: String?
    var usernameLabelText: String?
    var imageStringURL: String?

    init(user: User) {
        self.user = user
        nameLabelText = user.name
        usernameLabelText = user.username
        imageStringURL = formatAvatarURL()
    }

    private func formatAvatarURL() -> String {
        let apiURL = "https://mdiscourse.keepcoding.io"
        let formatedURL = user.avatarTemplate.replacingOccurrences(of: "{size}", with: "80")
        return apiURL + formatedURL
    }
}
