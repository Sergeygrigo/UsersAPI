//
//  TodosViewController.swift
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

class TodosViewController: UIViewController {
    
    lazy var userIdLabel: UILabel = {
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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: UIConstant.labelFontSize)
        label.textAlignment = .center
        label.numberOfLines = UIConstant.labelNumberOfLines
        return label
    }()
    
    lazy var complitedLabel: UILabel = {
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
        [userIdLabel, idLabel, titleLabel, complitedLabel].forEach {
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
    init(userIdLabel: Int,
         idLabel: Int,
         titleLabel: String,
         complitedLabel: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.userIdLabel.text = "User ID: " + String(userIdLabel)
        self.idLabel.text = "ID: " + String(idLabel)
        self.titleLabel.text = "Notion: " + titleLabel
        self.complitedLabel.text = "Complited: " + String(complitedLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TodosViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Todos"
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
