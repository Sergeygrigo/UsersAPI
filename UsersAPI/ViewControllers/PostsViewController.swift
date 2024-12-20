//
//  PostsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

class PostsViewController: UIViewController {
    
    var posts: [Post] = [Post]()
    var fullName: String = ""
    var username: String = ""
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.rowHeight = UIConstants.cellRowHeightPostsVC
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
    }
    
    init(fullName: String, username: String) {
        super.init(nibName: nil, bundle: nil)
        self.fullName = fullName
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        let postsData = posts[indexPath.row]
        cell.fullNameLabel.text = fullName
        cell.usernameLabel.text = username
        cell.postNameLabel.text = postsData.title
        cell.postTextView.text = postsData.body
        cell.delegate = self
        return cell
    }
    
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PostsViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Posts"
        view.backgroundColor = .secondarySystemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ApiManager.shared.sendRequest(apiType: .getPosts) { (posts: Posts) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.posts = posts.sorted {
                    $0.userID < $1.userID
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

extension PostsViewController: PostTableViewCellDelegate {
    func pushCommentViewController() {
        let vc = PostCommentsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
