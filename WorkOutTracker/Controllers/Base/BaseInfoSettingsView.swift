//
//  BaseInfoSettingsView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 21/01/2025.
//

import UIKit

class BaseInfoSettingsView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        label.text = "Account Settings"

        return label
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10

        return view
    }()
}

extension BaseInfoSettingsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(loginView)
        setupView(titleLabel)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}
