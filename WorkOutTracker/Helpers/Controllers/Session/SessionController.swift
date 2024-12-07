//
//  SessionController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: BaseInfoViews = {
        let view = BaseInfoViews(with: "Test", alignment: .center)
        
        return view
    }()
}
extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        addNavigationBarButton(at: .left, with: "Pause")
        addNavigationBarButton(at: .right, with: "Finish")
    }
}
