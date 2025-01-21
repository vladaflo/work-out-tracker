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
    
    func constaintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            
            loginView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            loginView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}
