//
//  WeekDayView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 05/12/2024.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
    }
}

extension WeekView.WeekDayView {
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureView() {
        super.configureView()
        
        backgroundColor = .red
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
