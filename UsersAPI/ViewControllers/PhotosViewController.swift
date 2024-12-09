//
//  PhotosViewController.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 28.11.2024.
//

import UIKit
import SnapKit

// MARK: - UIConstant
private enum UIConstant {
    static let uiStackViewSpacing: CGFloat = 10
    static let labelFontSize: CGFloat = 14
    static let imageFromURLHeightAndWidth: CGFloat = 100
    static let thumbnailImageFromURLHeightAndWidth: CGFloat = 50
    static let uiStackViewTopInset: CGFloat = 130
    static let uiStackViewLeadingOffset: CGFloat = -16
    static let uiStackViewTrailingOffset: CGFloat = 16
    static let labelNumberOfLines: Int = 0
}

class PhotosViewController: UIViewController {
    
    lazy var albumIdLabel: UILabel = {
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
    
    lazy var normalImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.imageFromURLHeightAndWidth)
            make.width.equalTo(UIConstant.imageFromURLHeightAndWidth)
        }
        return image
    }()
    
    lazy var thumbnailImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.thumbnailImageFromURLHeightAndWidth)
            make.width.equalTo(UIConstant.thumbnailImageFromURLHeightAndWidth)
        }
        return image
    }()
    
    lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstant.uiStackViewSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        [albumIdLabel, idLabel, titleLabel, normalImage, thumbnailImage].forEach {
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
    init(albumIdLabel: Int,
         idLabel: Int,
         titleLabel: String) {
        super.init(nibName: nil, bundle: nil)
        self.albumIdLabel.text = "Album: " + String(albumIdLabel)
        self.idLabel.text = "ID: " + String(idLabel)
        self.titleLabel.text = "Album name: " + titleLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PhotosViewController {
    // MARK: - InitialSetup
    func initialSetup() {
        navigationItem.title = "Photos"
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
