//
//  WeekView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 05/12/2024.
//

import UIKit

final class WeekView: BaseView {
    
    private let calendar = Calendar.current
    private let stackView = UIStackView()
}

extension WeekView {
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureView() {
        super.configureView()
        
        stackView.spacing = 7
        
        stackView.distribution = .fillEqually
        
        let weekdays = calendar.shortStandaloneWeekdaySymbols
        
        weekdays.forEach { _ in
            let view = WeekDayView()
            
            stackView.addArrangedSubview(view)
        }
    }
}
