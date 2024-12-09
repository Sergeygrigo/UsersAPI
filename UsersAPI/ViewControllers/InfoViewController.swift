//
//  InfoViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 21.11.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let userImageHeightAndWidth: CGFloat = 100
    static let fullNameLabelFontSize: CGFloat = 20
    static let usernameLabelFontSize: CGFloat = 14
    static let emailLabelFontSize: CGFloat = 14
    static let cityLabelFontsize: CGFloat = 14
    static let uiStackViewSpacing: CGFloat = 8
    static let uiStackViewTopInset: CGFloat = 130
    static let uiStackViewLeadingOffset: CGFloat = -16
    static let uiStackViewTrailingOffset: CGFloat = 16
    static let cellRowHeight: CGFloat = 50
    static let tableViewTopInset: CGFloat = -30
    static let tableViewHeight: CGFloat = 150
    static let labelNumberOfLines: Int = 0
}

class InfoViewController: UIViewController {
    
    let sections: [String] = ["Albums", "Posts", "Todos"]
//    var albums: [Album] = [Album]()
//    var comments: [Comment] = [Comment]()
//    var photos: [Photo] = [Photo]()
//    var posts: [Post] = [Post]()
//    var todos: [Todo] = [Todo]()
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.userImageHeightAndWidth)
            make.width.equalTo(UIConstant.userImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstant.fullNameLabelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: UIConstant.usernameLabelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstant.emailLabelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstant.cityLabelFontsize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SectionInfoCell.self, forCellReuseIdentifier: SectionInfoCell.identifier)
        tableView.rowHeight = UIConstant.cellRowHeight
        tableView.isScrollEnabled = false
        tableView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.tableViewHeight)
        }
        return tableView
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstant.uiStackViewSpacing
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
    
    init(userImage: UIImage,
         fullNameLabel: String,
         usernameLabel: String,
         emailLabel: String,
         cityLabel: String) {
        super.init(nibName: nil, bundle: nil)
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
            let albumsViewController = AlbumsViewController()
            self.navigationController?.pushViewController(albumsViewController, animated: true)
        case 1:
            let postsViewController = PostsViewController(fullName: fullNameLabel.text!, username: usernameLabel.text!)
            self.navigationController?.pushViewController(postsViewController, animated: true)
        case 2:
//            let todosData = todos[indexPath.row]
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
        
//        ApiManager.shared.sendRequest(apiType: .getAlbums) { (albums: Albums) in
//            DispatchQueue.main.async { [weak self] in
//                guard let self else { return }
//                self.albums = albums.sorted {
//                    $0.userID < $1.userID
//                }
//                self.tableView.reloadData()
//            }
//        }
        
//        ApiManager.shared.sendRequest(apiType: .getPosts) { (posts: Posts) in
//            DispatchQueue.main.async { [weak self] in
//                guard let self else { return }
//                self.posts = posts.sorted {
//                    $0.userID < $1.userID
//                }
//                self.tableView.reloadData()
//            }
//        }
        
//        ApiManager.shared.sendRequest(apiType: .getTodos) { (todos: Todos) in
//            DispatchQueue.main.async { [weak self] in
//                guard let self else { return }
//                self.todos = todos.sorted {
//                    $0.userID < $1.userID
//                }
//                self.tableView.reloadData()
//            }
//        }
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        view.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.uiStackViewTopInset)
            make.leading.equalToSuperview().offset(UIConstant.uiStackViewLeadingOffset)
            make.trailing.equalToSuperview().offset(UIConstant.uiStackViewTrailingOffset)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(uiStackView.snp.bottom).inset(UIConstant.tableViewTopInset)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
