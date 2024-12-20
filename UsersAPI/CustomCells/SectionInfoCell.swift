//
//  SectionTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 27.11.2024.
//

import UIKit
import SnapKit

class SectionInfoCell: UITableViewCell {
    
    static let identifier = "SectionInfoCell"
    
    lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .left
        return label
    }()
    
    lazy var sectionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "chevron.right", compatibleWith: .none)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.sectionImageHeightAndWidth)
            make.width.equalTo(UIConstants.sectionImageHeightAndWidth)
        }
        return imageView
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

extension SectionInfoCell {
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
        }
        
        contentView.addSubview(sectionImage)
        sectionImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.topIndent)
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
        }
    }
}
