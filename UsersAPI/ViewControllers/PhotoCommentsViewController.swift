//
//  PhotoCommentsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 11.12.2024.
//

import UIKit
import SnapKit

protocol PhotoCommentsViewControllerDelegate: AnyObject {
    func presentCommentViewController()
}

class PhotoCommentsViewController: UIViewController {
    
    var comments: [Comment] = [Comment]()
    
    weak var delegate: PhotoCommentsViewControllerDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PhotoCommentsTableViewCell.self, forCellReuseIdentifier: PhotoCommentsTableViewCell.identifier)
        tableView.rowHeight = UIConstants.cellRowHeightPhotoCommentsVC
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
        delegate?.presentCommentViewController()
    }

}

// MARK: - DataSource
extension PhotoCommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCommentsTableViewCell.identifier, for: indexPath) as! PhotoCommentsTableViewCell
        let commentsData = comments[indexPath.row]
        cell.commentNameLabel.text = commentsData.name
        cell.emailLabel.text = commentsData.email
        cell.commentTextView.text = commentsData.body
        return cell
    }
}

// MARK: - Delegate
extension PhotoCommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PhotoCommentsViewController {
    
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Comments"
        view.backgroundColor = .secondarySystemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ApiManager.shared.sendRequest(apiType: .getComments) { (comments: Comments) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.comments = comments.sorted {
                    $0.postID < $1.postID
                }
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
