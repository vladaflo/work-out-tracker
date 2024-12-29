//
//  BaseView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseView {
    func setupViews() {}
    func constraintViews() {}
    
    func configureAppearance() {
        backgroundColor = .white
    }
}

