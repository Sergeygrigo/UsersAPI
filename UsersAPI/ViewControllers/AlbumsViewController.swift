//
//  AlbumsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    var photos: [Photo] = [Photo]()
    var userID: Int = 0
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.rowHeight = UIConstants.cellRowHeightAlbumVC
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
    }
    
    init(userID: Int) {
        super.init(nibName: nil, bundle: nil)
        self.userID = userID
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - DataSource
extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as! AlbumTableViewCell
        let photosData = photos[indexPath.row]
        cell.titleLabel.text = photosData.title
        
        if let url = URL(string: photosData.url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data, error == nil else { return }
                DispatchQueue.main.async {
                    cell.imageFromAlbum.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        
        cell.delegate = self
        return cell
    }
}

// MARK: - Delegate
extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlbumsViewController {
    //MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Albums"
        view.backgroundColor = .secondarySystemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ApiManager.shared.sendRequest(apiType: .getPhotos) { (photos: Photos) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.photos = photos.sorted {
                    $0.albumID < $1.albumID
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

extension AlbumsViewController: AlbumTableViewCellDelegate {
    func pushCommentViewController() {
        let vc = PhotoCommentsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentShareSheet() {
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com/") else { return }
        let shareSheetVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        self.navigationController?.present(shareSheetVC, animated: true)
    }
}
