//
//  CommentsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

class CommentsViewController: UIViewController {
    
    lazy var postIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstants.fourteenFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstants.textNumberOfLines
        return label
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.stackViewTenSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [postIdLabel, idLabel, nameLabel, emailLabel, bodyLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupConstraints()
    }

}

extension CommentsViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Comments"
        view.backgroundColor = .secondarySystemBackground
    }
    
    // MARK: - SetupConstraints
    func setupConstraints() {
        view.addSubview(uiStackView)
        uiStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.stackViewTopIndentCommentsVC)
            make.leading.equalToSuperview().inset(UIConstants.leadingIndent)
            make.trailing.equalToSuperview().offset(UIConstants.trailingIndent)
            make.centerX.equalToSuperview()
        }
    }
}
