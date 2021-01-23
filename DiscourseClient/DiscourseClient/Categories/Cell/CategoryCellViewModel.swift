//
//  CategoryCellViewModel.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// ViewModel que representa un category en la lista
class CategoryCellViewModel {
    let category: Category
    var textLabelText: String?

    init(category: Category) {
        self.category = category
        // TODO: Asignar textLabelText, el título de la categoría
        textLabelText = category.name
    }
}
