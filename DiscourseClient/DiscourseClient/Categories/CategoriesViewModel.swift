//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol CategoriesViewDelegate: class {
    func categoriesFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    weak var viewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoryViewModels: [CategoryCellViewModel] = []

    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }

    func viewWasLoaded() {
        /** TODO:
         Recuperar el listado de categories del dataManager
         Asignar el resultado a la lista de viewModels (que representan celdas de la interfaz)
         Avisar a la vista de que ya tenemos categories listos para pintar
         */
        categoriesDataManager.fetchAllCategories { [weak self] result in
            switch result {
                case .success(let categoriesResponse):
                    self?.categoryViewModels = categoriesResponse?.categoryList.categories.map({ category -> CategoryCellViewModel in
                        return CategoryCellViewModel(category: category)
                    }) ?? [CategoryCellViewModel]()
                    self?.viewDelegate?.categoriesFetched()
                case .failure:
                    self?.viewDelegate?.errorFetchingCategories()
            }
        }
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoryViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoryViewModels.count else { return nil }
        return categoryViewModels[indexPath.row]
    }
}
