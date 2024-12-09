//
//  PostTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let userImageViewHeightWidth: CGFloat = 30
    static let fullNameLabelFontSize: CGFloat = 14
    static let usernameLabelFontSize: CGFloat = 12
    static let postNameLabelFontSize: CGFloat = 12
    static let postTextViewFontSize: CGFloat = 12
    static let stackViewSpacing: CGFloat = 8
    static let topIndent: CGFloat = 16
    static let bottomIndent: CGFloat = 16
    static let leadingIndent: CGFloat = 16
    static let trailingIndent: CGFloat = -16
    static let labelNumberOfLines: Int = 0
    static let postTextViewWidth: CGFloat = 200
    static let postTextViewHeight: CGFloat = 150
}

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.userImageViewHeightWidth)
            make.width.equalTo(UIConstant.userImageViewHeightWidth)
        }
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstant.fullNameLabelFontSize)
        label.textAlignment = .natural
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: UIConstant.usernameLabelFontSize)
        label.textAlignment = .natural
        return label
    }()
    
    lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstant.postNameLabelFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .black
        textView.font = .systemFont(ofSize: UIConstant.postTextViewFontSize)
        textView.textAlignment = .natural
        textView.snp.makeConstraints { make in
            make.width.equalTo(UIConstant.postTextViewWidth)
            make.height.equalTo(UIConstant.postTextViewHeight)
        }
        return textView
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIConstant.stackViewSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [fullNameLabel, usernameLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstant.stackViewSpacing
        stackView.alignment = .leading
        stackView.distribution = .fill
        [postNameLabel, postTextView].forEach {
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
    
}

extension PostTableViewCell {
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topIndent)
            make.leading.equalToSuperview().inset(UIConstant.leadingIndent)
        }
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topIndent)
            make.leading.equalTo(userImageView.snp.trailing).inset(UIConstant.trailingIndent)
        }
        
        contentView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom).offset(UIConstant.topIndent)
            make.leading.equalTo(userImageView.snp.trailing).inset(UIConstant.trailingIndent)
            make.trailing.equalToSuperview().offset(UIConstant.trailingIndent)
        }
    }
}
