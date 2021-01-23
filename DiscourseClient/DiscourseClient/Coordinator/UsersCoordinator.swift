//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by José Sancho on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa la pila de navegación del users list.
class UsersCoordinator: Coordinator {
    let presenter: UINavigationController
    let usersDataManager: UsersDataManager
    let userDetailDataManager: UserDetailDataManager
    var usersViewModel: UsersViewModel?

    init(presenter: UINavigationController, usersDataManager: UsersDataManager,
         userDetailDataManager: UserDetailDataManager) {

        self.presenter = presenter
        self.usersDataManager = usersDataManager
        self.userDetailDataManager = userDetailDataManager
    }

    override func start() {
        let usersViewModel = UsersViewModel(usersDataManager: usersDataManager)
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = NSLocalizedString("Users", comment: "")
        usersViewModel.viewDelegate = usersViewController
        usersViewModel.coordinatorDelegate = self
        self.usersViewModel = usersViewModel
        presenter.pushViewController(usersViewController, animated: false)
    }

    override func finish() {}
}

extension UsersCoordinator: UsersCoordinatorDelegate {
    func didSelect(user: User) {
        /** TODO: Lanzar módulo UserDetail
         Para ello tendrás que crear UserDetailViewModel, UserDetailViewController.
         Asignar "self" como coordinatorDelegate del módulo: Queremos escuchar eventos que requieren navegación desde ese módulo.
         Asignar el VC al viewDelegate del VM. De esta forma, el VC se enterará de lo necesario para pintar la UI
         Finalmente, lanzar el UserDetailViewController sobre el presenter.
         */
        let userDetailViewModel = UserDetailViewModel(userID: user.id,
                                                      userDetailDataManager: userDetailDataManager)
        let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
        userDetailViewController.title = NSLocalizedString("User Detail", comment: "")
        userDetailViewModel.viewDelegate = userDetailViewController
        userDetailViewModel.coordinatorDelegate = self
        presenter.pushViewController(userDetailViewController, animated: true)
    }
}

extension UsersCoordinator: UserDetailCoordinatorDelegate {
    func userDetailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
}
