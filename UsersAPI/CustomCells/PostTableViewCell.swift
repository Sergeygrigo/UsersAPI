//
//  PostTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

protocol PostTableViewCellDelegate: AnyObject {
    func pushCommentViewController()
    func presentShareSheet()
}

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    weak var delegate: PostTableViewCellDelegate?
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.thumbnailImageHeightAndWidth)
            make.width.equalTo(UIConstants.thumbnailImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .natural
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: UIConstants.twelveFontSize)
        label.textAlignment = .natural
        return label
    }()
    
    lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstants.twelveFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .black
        textView.font = .systemFont(ofSize: UIConstants.twelveFontSize)
        textView.textAlignment = .natural
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.textViewWidthPostTVC)
        }
        return textView
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
    
    lazy var shareButton: UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var uiButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIConstants.stackViewSixteenSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [likeButton, commentButton, shareButton].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIConstants.stackViewSixteenSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [userImageView, fullNameLabel, usernameLabel].forEach {
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
    
    @objc func shareButtonTapped() {
        delegate?.presentShareSheet()
    }
    
}

extension PostTableViewCell {
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
        }
        
        contentView.addSubview(postNameLabel)
        postNameLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom).offset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
        }
        
        contentView.addSubview(postTextView)
        postTextView.snp.makeConstraints { make in
            make.top.equalTo(postNameLabel.snp.bottom).offset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
        }

        contentView.addSubview(uiButtonStackView)
        uiButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(postTextView.snp.bottom).offset(UIConstants.topIndent)
            make.bottom.equalToSuperview().inset(UIConstants.bottomIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
        }
    }
}
