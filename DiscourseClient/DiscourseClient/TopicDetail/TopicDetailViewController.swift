//
//  TopicDetailViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController que representa el detalle de un Topic
class TopicDetailViewController: UIViewController {

    lazy var labelTopicID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelTopicTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelPostsNumberTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var topicIDStackView: UIStackView = {
        let labelTopicIDTitle = UILabel()
        labelTopicIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTopicIDTitle.text = NSLocalizedString("Topic ID: ", comment: "")
        labelTopicIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelTopicIDTitle, labelTopicID])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var topicNameStackView: UIStackView = {
        let labelTopicTitleTitle = UILabel()
        labelTopicTitleTitle.text = NSLocalizedString("Topic name: ", comment: "")
        labelTopicTitleTitle.translatesAutoresizingMaskIntoConstraints = false

        let topicNameStackView = UIStackView(arrangedSubviews: [labelTopicTitleTitle, labelTopicTitle])
        topicNameStackView.translatesAutoresizingMaskIntoConstraints = false
        topicNameStackView.axis = .horizontal

        return topicNameStackView
    }()

    lazy var topicPostsNumberStackView: UIStackView = {
        let labelTopicPostsNumberTitle = UILabel()
        labelTopicPostsNumberTitle.text = NSLocalizedString("Number of posts: ", comment: "")
        labelTopicPostsNumberTitle.translatesAutoresizingMaskIntoConstraints = false

        let topicPostsNumberStackView = UIStackView(arrangedSubviews: [labelTopicPostsNumberTitle, labelPostsNumberTitle])
        topicPostsNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        topicPostsNumberStackView.axis = .horizontal

        return topicPostsNumberStackView
    }()

    let viewModel: TopicDetailViewModel

    init(viewModel: TopicDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(topicIDStackView)
        NSLayoutConstraint.activate([
            topicIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(topicNameStackView)
        NSLayoutConstraint.activate([
            topicNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicNameStackView.topAnchor.constraint(equalTo: topicIDStackView.bottomAnchor, constant: 16)
        ])

        view.addSubview(topicPostsNumberStackView)
        NSLayoutConstraint.activate([
            topicPostsNumberStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicPostsNumberStackView.topAnchor.constraint(equalTo: topicNameStackView.bottomAnchor, constant: 16)
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

    @objc func deleteButtonTapped() {
        print("deleteButtonTapped!!!")
        viewModel.backButtonTapped()
    }

    fileprivate func showErrorFetchingTopicDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching topic detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func updateUI() {
        labelTopicID.text = viewModel.labelTopicIDText
        labelTopicTitle.text = viewModel.labelTopicNameText
        labelPostsNumberTitle.text = "\(viewModel.labelPostsNumberText ?? "0")"

        if let canDeleteTopic = viewModel.candDelete, canDeleteTopic {
            let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteButtonTapped))
            rightBarButtonItem.tintColor = .red
            navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
}

extension TopicDetailViewController: TopicDetailViewDelegate {
    func topicDeleted() {
        // TODO: Pepe
    }

    func errorDeletingTopic() {
        // TODO: Pepe
    }

    func topicDetailFetched() {
        updateUI()
    }

    func errorFetchingTopicDetail() {
        showErrorFetchingTopicDetailAlert()
    }
}
