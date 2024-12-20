//
//  InfoViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 21.11.2024.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    let sections: [String] = ["Albums", "Posts", "Todos"]
    var userID: Int = 0
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.infoImageHeightAndWidth)
            make.width.equalTo(UIConstants.infoImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstants.twentyFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SectionInfoCell.self, forCellReuseIdentifier: SectionInfoCell.identifier)
        tableView.rowHeight = UIConstants.cellRowHeightInfoVC
        tableView.isScrollEnabled = false
        tableView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.tableViewHeightInfoVC)
        }
        return tableView
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.stackViewEightSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [userImage, fullNameLabel, usernameLabel, emailLabel, cityLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
    }
    
    init(userID: Int,
         userImage: UIImage,
         fullNameLabel: String,
         usernameLabel: String,
         emailLabel: String,
         cityLabel: String) {
        super.init(nibName: nil, bundle: nil)
        self.userID = userID
        self.userImage.image = userImage
        self.fullNameLabel.text = fullNameLabel
        self.usernameLabel.text = "@" + usernameLabel
        self.emailLabel.text = "E-mail: " + emailLabel
        self.cityLabel.text = "City: " + cityLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - DataSource
extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionInfoCell.identifier, for: indexPath) as! SectionInfoCell
        let sectionData = sections[indexPath.row]
        cell.sectionLabel.text = sectionData
        return cell
    }
}

// MARK: - Delegate
extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let albumsViewController = AlbumsViewController(userID: userID)
            self.navigationController?.pushViewController(albumsViewController, animated: true)
        case 1:
            let postsViewController = PostsViewController(fullName: fullNameLabel.text!, username: usernameLabel.text!)
            self.navigationController?.pushViewController(postsViewController, animated: true)
        case 2:
            let todosViewController = TodosViewController()
            self.navigationController?.pushViewController(todosViewController, animated: true)
        default:
            break
        }
    }
}

extension InfoViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Details"
        view.backgroundColor = .secondarySystemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        view.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.stackViewTopIndentCommentsVC)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(uiStackView.snp.bottom).offset(UIConstants.tableViewTopIndentInfoVC)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
