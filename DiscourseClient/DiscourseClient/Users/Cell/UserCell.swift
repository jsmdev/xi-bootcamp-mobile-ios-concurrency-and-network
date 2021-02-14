//
//  UserCell.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var fotoImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var username: UILabel?

    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.delegate = self
            nameLabel?.text = viewModel.nameLabelText
            username?.text = viewModel.usernameLabelText
            setUserPhoto()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if let width = fotoImageView?.bounds.width {
            fotoImageView?.layer.cornerRadius =  width / 2
        }
        fotoImageView?.layer.borderWidth = 1
        fotoImageView?.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView?.image = nil
        nameLabel?.text = nil
        username?.text = nil
    }

    func setUserPhoto() {
        DispatchQueue.main.async {
            self.fotoImageView?.image = self.viewModel?.userImage
        }
    }
}

extension UserCell: UserCellViewModelDelegate {
    func didDownload(image: UIImage?) {
        DispatchQueue.main.async {
            self.fotoImageView?.image = self.viewModel?.userImage
        }
    }
}
