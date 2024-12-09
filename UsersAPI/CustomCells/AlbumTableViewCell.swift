//
//  AlbumTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let titleLabelFontSize: CGFloat = 14
    static let titleLabelNumberOfLines: Int = 0
    static let uiStackViewHorizontalSpacing: CGFloat = 8
    static let uiStackViewVerticalSpacing: CGFloat = 8
    static let uiStackViewVerticalInset: CGFloat = 16
    static let imageFromAlbumHeight: CGFloat = 400
    static let imageFromAlbumWidth: CGFloat = 400
    static let titleLabelTopInset: CGFloat = 16
    static let imageFromAlbumTopOffset: CGFloat = 16
    static let uiStackViewTopOffset: CGFloat = 16
    static let uiStackViewLeadingInset: CGFloat = 16
}

class AlbumTableViewCell: UITableViewCell {
    
    static let identifier = "AlbumTableViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIConstant.titleLabelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.titleLabelNumberOfLines
        return label
    }()
    
    lazy var imageFromAlbum: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.imageFromAlbumHeight)
            make.width.equalTo(UIConstant.imageFromAlbumWidth)
        }
        return imageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bubble"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIConstant.uiStackViewHorizontalSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [likeButton, commentButton, sendButton].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonTapped() {
        
    }
    
    @objc func commentButtonTapped() {
        
    }
    
}

extension AlbumTableViewCell {
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.titleLabelTopInset)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(imageFromAlbum)
        imageFromAlbum.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIConstant.imageFromAlbumTopOffset)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalTo(imageFromAlbum.snp.bottom).offset(UIConstant.uiStackViewTopOffset)
            make.leading.equalToSuperview().inset(UIConstant.uiStackViewLeadingInset)
        }
    }
    
}
