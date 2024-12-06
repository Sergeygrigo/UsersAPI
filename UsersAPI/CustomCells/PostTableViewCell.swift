//
//  PostTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit

private enum UIConstant {
    static let userImageViewHeightWidth: CGFloat = 30
    static let fullNameLabelFontSize: CGFloat = 14
    static let usernameLabelFontSize: CGFloat = 12
    static let postNameLabelFontSize: CGFloat = 12
    static let postTextViewFontSize: CGFloat = 12
    static let stackViewSpacing: CGFloat = 8
    static let topInset: CGFloat = 16
    static let bottomInset: CGFloat = 16
    static let leadingInset: CGFloat = 16
    static let trailingOffset: CGFloat = -16
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
        label.text = "Hello"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstant.fullNameLabelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: UIConstant.usernameLabelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: UIConstant.postNameLabelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Hello"
        textView.textColor = .black
        textView.font = .systemFont(ofSize: UIConstant.postTextViewFontSize)
        textView.textAlignment = .natural
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
        stackView.alignment = .center
        stackView.distribution = .fill
        [postNameLabel, postTextView].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()

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

extension PostTableViewCell {
    func setupConstraints() {
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topInset)
            make.leading.equalToSuperview().inset(UIConstant.leadingInset)
        }
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topInset)
            make.trailing.equalToSuperview().offset(UIConstant.trailingOffset)
        }
        
        contentView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom).offset(UIConstant.topInset)
            make.trailing.equalToSuperview().offset(UIConstant.trailingOffset)
        }
    }
}
