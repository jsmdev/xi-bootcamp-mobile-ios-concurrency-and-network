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

    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.clearButtonMode = .always
        textField.placeholder = NSLocalizedString("Edit name", comment: "")
        return textField
    }()

    lazy var labelUserUsername: UILabel = {
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
        let labelUserNameTitle = UILabel()
        labelUserNameTitle.text = NSLocalizedString("Name: ", comment: "")
        labelUserNameTitle.translatesAutoresizingMaskIntoConstraints = false

        let userNameStackView = UIStackView(arrangedSubviews: [labelUserNameTitle, labelUserName, nameTextField])
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameStackView.axis = .horizontal

        return userNameStackView
    }()

    lazy var userUsernameStackView: UIStackView = {
        let labelUserUsernameTitle = UILabel()
        labelUserUsernameTitle.text = NSLocalizedString("User name: ", comment: "")
        labelUserUsernameTitle.translatesAutoresizingMaskIntoConstraints = false

        let userUsernameStackView = UIStackView(arrangedSubviews: [labelUserUsernameTitle, labelUserUsername])
        userUsernameStackView.translatesAutoresizingMaskIntoConstraints = false
        userUsernameStackView.axis = .horizontal

        return userUsernameStackView
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

        view.addSubview(userUsernameStackView)
        NSLayoutConstraint.activate([
            userUsernameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userUsernameStackView.topAnchor.constraint(equalTo: userNameStackView.bottomAnchor, constant: 16)
        ])

        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        nameTextField.isHidden = true
    }

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }

    @objc func updateNameTapped() {
        if let newName = nameTextField.text, newName.count > 0 {
            viewModel.updateNameTapped(name: newName)
        } else {
            let alertMessage: String = NSLocalizedString("Name is empty\nPlease try again later", comment: "")
            showAlert(alertMessage)
        }
    }

    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func showErrorUpdatingUserAlert() {
        let alertMessage: String = NSLocalizedString("Error updating user\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func showUserUpdatedSuccessfullyAlert() {
        let alertMessage: String = NSLocalizedString("User data updated successfully !!!", comment: "")
        showAlert(alertMessage, alertTitle: NSLocalizedString("Success", comment: ""))
    }

    fileprivate func updateUI() {
        labelUserID.text = viewModel.labelUserIDText
        labelUserName.text = viewModel.labelUserNameText
        nameTextField.text = viewModel.labelUserNameText
        labelUserUsername.text = viewModel.labelUserUsernameText

        if let canEditName = viewModel.candEditName, canEditName {
            labelUserName.isHidden = canEditName
            nameTextField.isHidden = !canEditName

            let submitButton = UIButton(type: .system)
            submitButton.translatesAutoresizingMaskIntoConstraints = false
            submitButton.setTitle(NSLocalizedString("Update name", comment: ""), for: .normal)
            submitButton.backgroundColor = .cyan
            submitButton.setTitleColor(.white, for: .normal)
            submitButton.addTarget(self, action: #selector(updateNameTapped), for: .touchUpInside)

            view.addSubview(submitButton)
            NSLayoutConstraint.activate([
                submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
                submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
                submitButton.topAnchor.constraint(equalTo: userUsernameStackView.bottomAnchor, constant: 20)
            ])
        }
    }
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userNameUpdated() {
        showUserUpdatedSuccessfullyAlert()
    }

    func errorUpdatingUserName() {
        showErrorUpdatingUserAlert()
    }

    func userDetailFetched() {
        updateUI()
    }

    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
}
