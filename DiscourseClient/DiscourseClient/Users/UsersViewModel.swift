//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate a través del cual nos vamos a comunicar con el coordinator, contándole todo aquello que atañe a la navegación
protocol UsersCoordinatorDelegate: class {
    func didSelect(user: User)
}

/// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol UsersViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

/// ViewModel que representa un listado de users
class UsersViewModel {
    weak var coordinatorDelegate: UsersCoordinatorDelegate?
    weak var viewDelegate: UsersViewDelegate?
    let usersDataManager: UsersDataManager
    var userViewModels: [UserCellViewModel] = []

    init(usersDataManager: UsersDataManager) {
        self.usersDataManager = usersDataManager
    }

    func viewWasLoaded() {
        /**
         Recuperar el listado de latest Users del dataManager
         Asignar el resultado a la lista de viewModels (que representan celdas de la interfaz
         Avisar a la vista de que ya tenemos Users listos para pintar
         */
        usersDataManager.fetchAllUsers { [weak self] result in
            switch result {
                case .success(let usersResponse):
                    self?.userViewModels = usersResponse?.directoryItems.map({ directoryItem -> UserCellViewModel in
                        return UserCellViewModel(user: directoryItem.user)
                    }) ?? [UserCellViewModel]()
                    DispatchQueue.main.async {
                        self?.viewDelegate?.usersFetched()
                    }
                case .failure(let error):
                    print("Error when fetching users: \(error)")
                    DispatchQueue.main.async {
                        self?.viewDelegate?.errorFetchingUsers()
                    }
            }
        }
    }

    func heightForRow() -> Int {
        return 100
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return userViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userViewModels.count else { return nil }
        return userViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < userViewModels.count else { return }
        coordinatorDelegate?.didSelect(user: userViewModels[indexPath.row].user)
    }
}
