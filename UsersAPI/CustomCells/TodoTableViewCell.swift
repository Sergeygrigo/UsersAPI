//
//  TodoTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let todoLabelFontSize: CGFloat = 14
    static let todoLabelNumberOfLines: Int = 0
    static let todoLabelWidth: CGFloat = 300
    static let leadingIndent: CGFloat = 16
    static let trailingIndent: CGFloat = -16
}

class TodoTableViewCell: UITableViewCell {
    
    static let identifier = "TodoTableViewCell"

    lazy var todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.todoLabelFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstant.todoLabelNumberOfLines
        label.snp.makeConstraints { make in
            make.width.equalTo(UIConstant.todoLabelWidth)
        }
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TodoTableViewCell {
    
    // MARK: - SetupConstraints
    func setupConstraint() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(todoLabel)
        todoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.leadingIndent)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(UIConstant.trailingIndent)
            make.centerY.equalToSuperview()
        }
    }
}
