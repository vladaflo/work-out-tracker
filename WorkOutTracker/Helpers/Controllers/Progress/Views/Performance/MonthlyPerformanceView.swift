//
//  MonthlyPerformanceView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 29/12/2024.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoViews {
    
    private let chartView = UIView()
    
    func configure(with itmes: [BarView.Data]) {
       // chartView.configure(with: itmes)
    }
}

extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        
        setupView(chartView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -15),
            chartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        chartView.backgroundColor = .cyan
    }
}
