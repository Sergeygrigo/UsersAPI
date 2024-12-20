//
//  AlbumTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

protocol AlbumTableViewCellDelegate: AnyObject {
    func pushCommentViewController()
}

class AlbumTableViewCell: UITableViewCell {
    
    static let identifier = "AlbumTableViewCell"
    
    weak var delegate: AlbumTableViewCellDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var imageFromAlbum: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.albumImageHeightAndWidth)
            make.width.equalTo(UIConstants.albumImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bubble"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
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
        stackView.spacing = UIConstants.stackViewEightSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [likeButton, commentButton, sendButton].forEach {
            stackView.addArrangedSubview($0)
        }
        stackView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.stackViewHeightAlbumTVC)
        }
        return stackView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonTapped() {
        if likeButton.tintColor == .black {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .systemRed
        } else if likeButton.tintColor == .systemRed {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .black
        }
    }
    
    @objc func commentButtonTapped() {
        delegate?.pushCommentViewController()
    }
    
}

extension AlbumTableViewCell {
    
    func initialSetup() {
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
        }
        
        contentView.addSubview(imageFromAlbum)
        imageFromAlbum.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
        }
        
        contentView.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalTo(imageFromAlbum.snp.bottom).offset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.bottom.equalToSuperview().inset(UIConstants.bottomIndent)
        }
    }
}
