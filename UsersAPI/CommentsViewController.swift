//
//  CommentsViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let labelFontSize: CGFloat = 14
    static let uiStackViewSpacing: CGFloat = 10
    static let uiStackViewTopInset: CGFloat = 130
    static let uiStackViewLeadingOffset: CGFloat = -16
    static let uiStackViewTrailingOffset: CGFloat = 16
    static let labelNumberOfLines: Int = 0
}

class CommentsViewController: UIViewController {
    
    lazy var postIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstant.uiStackViewSpacing
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
    
    // MARK: - Init
    init(postIdLabel: Int,
         idLabel: Int,
         nameLabel: String,
         emailLabel: String,
         bodyLabel: String) {
        super.init(nibName: nil, bundle: nil)
        self.postIdLabel.text = "Post number: " + String(postIdLabel)
        self.idLabel.text = "ID: " + String(idLabel)
        self.nameLabel.text = "Name: " + nameLabel
        self.emailLabel.text = "Email: " + emailLabel
        self.bodyLabel.text = "Comment: " + bodyLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            make.top.equalToSuperview().inset(UIConstant.uiStackViewTopInset)
            make.leading.equalToSuperview().offset(UIConstant.uiStackViewLeadingOffset)
            make.trailing.equalToSuperview().offset(UIConstant.uiStackViewTrailingOffset)
            make.centerX.equalToSuperview()
        }
    }
}
