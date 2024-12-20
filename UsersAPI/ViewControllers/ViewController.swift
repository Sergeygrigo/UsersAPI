//
//  ViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 06.11.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
        
    var users: [User] = [User]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserInfoCell.self, forCellReuseIdentifier: UserInfoCell.identifier)
        tableView.estimatedRowHeight = UIConstants.cellRowHeightVC
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillAppear(true)
        setupConstraints()
        initialSetup()
    }
}

// MARK: - DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCell.identifier, for: indexPath) as! UserInfoCell
        let usersData = users[indexPath.row]
        cell.userImage.image = UIImage(named: "user")
        cell.nameLabel.text = usersData.name
        cell.emailLabel.text = usersData.email
        return cell
    }
}

// MARK: - Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let usersData = users[indexPath.row]
        let infoViewController = InfoViewController(userID: usersData.id,
                                                    userImage: UIImage(named: "user")!,
                                                    fullNameLabel: usersData.name,
                                                    usernameLabel: usersData.username,
                                                    emailLabel: usersData.email,
                                                    cityLabel: usersData.address.city)
        self.navigationController?.pushViewController(infoViewController, animated: true)
    }
}

extension ViewController {
    
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "List of users"
        
        tableView.delegate = self
        tableView.dataSource = self

        ApiManager.shared.sendRequest(apiType: .getUsers) { (users: Users) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.users = users.sorted {
                    $0.id < $1.id
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
    
    // MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        
        appearence.backgroundColor = .secondarySystemBackground
        appearence.shadowColor = .clear
        appearence.shadowImage = UIImage()
        
        appearence.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        appearence.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        
        navigationController?.navigationBar.tintColor = .black
        UIBarButtonItem.appearance().tintColor = .black
    }
}
