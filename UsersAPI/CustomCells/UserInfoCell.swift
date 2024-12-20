//
//  UserInfoCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 19.11.2024.
//

import UIKit
import SnapKit

class UserInfoCell: UITableViewCell {
    
    static let identifier = "UserInfoCell"
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.thumbnailImageHeightAndWidth)
            make.width.equalTo(UIConstants.thumbnailImageHeightAndWidth)
        }
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: UIConstants.elevenFontSize)
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.emailLabelWidth)
        }
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.stackViewTenSpacing
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [nameLabel, emailLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIConstants.stackViewSixteenSpacing
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        [userImage, labelStackView].forEach {
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

extension UserInfoCell {
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.bottom.equalToSuperview().inset(UIConstants.bottomIndent)
        }
    }
}
