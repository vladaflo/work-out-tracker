//
//  SettingsController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class SettingsController: BaseController {
    
    private let loginView: BaseInfoSettingsView = {
        let view = BaseInfoSettingsView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
    }
}

extension SettingsController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(loginView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            loginView.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
