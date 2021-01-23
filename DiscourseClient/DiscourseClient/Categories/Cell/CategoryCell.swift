//
//  CategoryCell.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.textLabelText
        }
    }
}
