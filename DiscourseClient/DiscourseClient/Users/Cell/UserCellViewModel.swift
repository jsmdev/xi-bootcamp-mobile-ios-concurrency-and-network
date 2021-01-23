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
    var textLabelText: String?

    init(user: User) {
        self.user = user
        // TODO: Asignar textLabelText, el nombre del user
        textLabelText = "\(user.name) [\(user.username)]"
    }
}
