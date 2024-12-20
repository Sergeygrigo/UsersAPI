//
//  PhotoCommentsTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 11.12.2024.
//

import UIKit
import SnapKit

class PhotoCommentsTableViewCell: UITableViewCell {
    
    static let identifier = "PhotoCommentsTableViewCell"
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.thumbnailImageHeightAndWidth)
            make.height.equalTo(UIConstants.thumbnailImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var commentNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: UIConstants.twelveFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var commentTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .black
        textView.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        textView.textAlignment = .natural
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.photoCommentsTextViewHeightAndWidth)
        }
        return textView
    }()
    
    lazy var uiStackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.stackViewEightSpacing
        stackView.alignment = .leading
        stackView.distribution = .fill
        [commentNameLabel, emailLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PhotoCommentsTableViewCell {
    
    func initialSetup() {
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
        }
        
        contentView.addSubview(uiStackViewVertical)
        uiStackViewVertical.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalTo(userImage.snp.trailing).offset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
        }
        
        contentView.addSubview(commentTextView)
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(uiStackViewVertical.snp.bottom).offset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
            make.bottom.equalToSuperview().inset(UIConstants.bottomIndent)
        }
    }
}
