//
//  PostCommentsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 11.12.2024.
//

import UIKit
import SnapKit

class PostCommentsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostCommentsTableViewCell.self, forCellReuseIdentifier: PostCommentsTableViewCell.identifier)
        return tableView
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
    }

}

// MARK: - DataSource
extension PostCommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCommentsTableViewCell.identifier, for: indexPath) as! PostCommentsTableViewCell
        return cell
    }
}

// MARK: - Delegate
extension PostCommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension PostCommentsViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Comments"
        view.backgroundColor = .secondarySystemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        
    }
}
