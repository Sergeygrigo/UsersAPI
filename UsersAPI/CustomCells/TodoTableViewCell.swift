//
//  TodoTableViewCell.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 05.12.2024.
//

import UIKit
import SnapKit

class TodoTableViewCell: UITableViewCell {
    
    static let identifier = "TodoTableViewCell"

    lazy var todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .natural
        label.numberOfLines = UIConstants.textNumberOfLines
        label.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.todoLabelWidth)
        }
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
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
    
    @objc func doneButtonTapped() {
        if doneButton.tintColor == .gray {
            doneButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            doneButton.tintColor = .systemGreen
        } else if doneButton.tintColor == .systemGreen {
            doneButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            doneButton.tintColor = .gray
        }
    }

}

extension TodoTableViewCell {
    
    // MARK: - SetupConstraints
    func setupConstraint() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(todoLabel)
        todoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstants.trailingIndent)
            make.centerY.equalToSuperview()
        }
    }
}
