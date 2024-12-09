//
//  SectionTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 27.11.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let sectionLabelFontSize: CGFloat = 14
    static let sectionImageWidthHeight: CGFloat = 20
    static let uiStackViewSpacing: CGFloat = 300
    static let topIndent: CGFloat = 16
    static let leadingIndent: CGFloat = 16
    static let trailingIndent: CGFloat = 16
}

class SectionInfoCell: UITableViewCell {
    
    static let identifier = "SectionInfoCell"
    
    lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIConstant.sectionLabelFontSize)
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
            make.height.equalTo(UIConstant.sectionImageWidthHeight)
            make.width.equalTo(UIConstant.sectionImageWidthHeight)
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
            make.top.equalToSuperview().inset(UIConstant.topIndent)
            make.leading.equalToSuperview().inset(UIConstant.leadingIndent)
        }
        
        contentView.addSubview(sectionImage)
        sectionImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topIndent)
            make.trailing.equalToSuperview().inset(UIConstant.trailingIndent)
        }
    }
}
