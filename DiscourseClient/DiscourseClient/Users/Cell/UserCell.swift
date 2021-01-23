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
            nameLabel?.text = viewModel.nameLabelText
            username?.text = viewModel.usernameLabelText
            setFotoImage(with: viewModel.imageStringURL)
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

    private func setFotoImage(with imagePath: String?) {
        guard let imageString = imagePath, let imageURL: URL = URL(string: imageString) else { return }

        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            let image: UIImage? = UIImage(data: imageData)

            DispatchQueue.main.async {
                self.fotoImageView?.image = image
            }
        }
    }
}
