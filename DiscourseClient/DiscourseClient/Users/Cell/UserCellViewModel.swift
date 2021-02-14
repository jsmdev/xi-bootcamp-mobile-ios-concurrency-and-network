//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit

protocol UserCellViewModelDelegate: class {
    func didDownload(image: UIImage?)
}

/// ViewModel que representa un user en la lista
class UserCellViewModel {
    let user: User
    var nameLabelText: String?
    var usernameLabelText: String?
    var imageStringURL: String?
    var userImage: UIImage?
    weak var delegate: UserCellViewModelDelegate?

    init(user: User) {
        self.user = user
        nameLabelText = user.name
        usernameLabelText = user.username
        imageStringURL = formatAvatarURL()
        getPhotoImage(with: imageStringURL)
    }

    private func formatAvatarURL() -> String {
        let apiURL = "https://mdiscourse.keepcoding.io"
        let formatedURL = user.avatarTemplate.replacingOccurrences(of: "{size}", with: "80")
        return apiURL + formatedURL
    }
    
    private func getPhotoImage(with imagePath: String?) {
        guard let imageString = imagePath, let imageURL: URL = URL(string: imageString) else { return }

        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            let image: UIImage? = UIImage(data: imageData)
            self.userImage = image
            self.delegate?.didDownload(image: image)
        }
    }
}
