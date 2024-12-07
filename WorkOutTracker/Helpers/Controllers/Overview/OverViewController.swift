//
//  OverViewController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

class OverViewController: BaseController {
    
    private let navBar = OverViewNavigationBar()
}

extension OverViewController {
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
