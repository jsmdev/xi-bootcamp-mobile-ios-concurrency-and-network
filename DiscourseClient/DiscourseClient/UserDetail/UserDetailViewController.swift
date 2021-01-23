//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by José Sancho on 20/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    lazy var labelUserID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelUserTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelPostsNumberTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var userIDStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User ID: ", comment: "")
        labelUserIDTitle.textColor = .black

        let userIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUserID])
        userIDStackView.translatesAutoresizingMaskIntoConstraints = false
        userIDStackView.axis = .horizontal

        return userIDStackView
    }()

    lazy var userNameStackView: UIStackView = {
        let labelUserTitleTitle = UILabel()
        labelUserTitleTitle.text = NSLocalizedString("User name: ", comment: "")
        labelUserTitleTitle.translatesAutoresizingMaskIntoConstraints = false

        let userNameStackView = UIStackView(arrangedSubviews: [labelUserTitleTitle, labelUserTitle])
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameStackView.axis = .horizontal

        return userNameStackView
    }()

    lazy var userPostsNumberStackView: UIStackView = {
        let labelUserPostsNumberTitle = UILabel()
        labelUserPostsNumberTitle.text = NSLocalizedString("Number of posts: ", comment: "")
        labelUserPostsNumberTitle.translatesAutoresizingMaskIntoConstraints = false

        let userPostsNumberStackView = UIStackView(arrangedSubviews: [labelUserPostsNumberTitle, labelPostsNumberTitle])
        userPostsNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        userPostsNumberStackView.axis = .horizontal

        return userPostsNumberStackView
    }()

    let viewModel: UserDetailViewModel

    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(userNameStackView)
        NSLayoutConstraint.activate([
            userNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userNameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 16)
        ])

        view.addSubview(userPostsNumberStackView)
        NSLayoutConstraint.activate([
            userPostsNumberStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userPostsNumberStackView.topAnchor.constraint(equalTo: userNameStackView.bottomAnchor, constant: 16)
        ])

        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }

//    @objc func deleteButtonTapped() {
//        viewModel.deleteButtonTapped()
//    }

    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func updateUI() {
        labelUserID.text = viewModel.labelUserIDText
//        labelUserTitle.text = viewModel.labelUserNameText
//        labelPostsNumberTitle.text = "\(viewModel.labelPostsNumberText ?? "0")"

//        if let canDeleteUser = viewModel.candDelete, canDeleteUser {
//            let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteButtonTapped))
//            rightBarButtonItem.tintColor = .red
//            navigationItem.rightBarButtonItem = rightBarButtonItem
//        }
    }
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userDetailFetched() {
        updateUI()
    }

    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
}
