//
//  AlbumsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let cellRowHeight: CGFloat = 500
}

class AlbumsViewController: UIViewController {
    
    var albums: [Album] = [Album]()
    var photos: [Photo] = [Photo]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.rowHeight = UIConstant.cellRowHeight
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
extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as! AlbumTableViewCell
        let photosData = photos[indexPath.row].title
        cell.titleLabel.text = photosData
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
        
        ApiManager.shared.sendRequest(apiType: .getAlbums) { (albums: Albums) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.albums = albums.sorted { 
                    $0.userID < $1.userID
                }
                self.tableView.reloadData()
            }
        }
        
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
