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
        /** TODO:
         Recuperar el listado de latest Users del dataManager
         Asignar el resultado a la lista de viewModels (que representan celdas de la interfaz
         Avisar a la vista de que ya tenemos Users listos para pintar
         */


//        UsersDataManager.fetchAllUsers { [weak self] result in
//            switch result {
//                case .success(let latestUsersResponse):
//                    self?.topicViewModels = latestUsersResponse?.Users.map({ topic -> TopicCellViewModel in
//                        return TopicCellViewModel(topic: topic)
//                    })
//                    self?.viewDelegate?.UsersFetched()
//                case .failure:
//                    self?.viewDelegate?.errorFetchingUsers()
//            }
//        }
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
