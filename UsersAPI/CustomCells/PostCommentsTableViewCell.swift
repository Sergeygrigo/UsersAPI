//
//  PostCommentsTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 11.12.2024.
//

import UIKit
import SnapKit

class PostCommentsTableViewCell: UITableViewCell {
    
    static let identifier = "PostCommentsTableViewCell"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostCommentsTableViewCell {
    // MARK: - SetupConstraints
    func setupConstraints() {
        
    }
}
