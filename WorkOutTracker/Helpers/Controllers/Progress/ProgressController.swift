//
//  ProgressController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class ProgressController: BaseController {
    
    private let dailyPerformanceView = DailyPerformanceViews(with: Resources.Strings.Progress.dailyPerformance, buttonTitle: Resources.Strings.Progress.last7Days)
    
    private let monthlyPerformanceView = MonthlyPerformanceView(with: Resources.Strings.Progress.monthlyPerformance, buttonTitle: Resources.Strings.Progress.last10Months)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    extension ProgressController {
        override func setupViews() {
            super.setupViews()
            
            view.setupView(dailyPerformanceView)
            view.setupView(monthlyPerformanceView)
}
 
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68)
    
        ])
}
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavigationBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title (for: .progress)
        
        addNavigationBarButton(at: .left, with: Resources.Strings.Progress.navigationBarLeft)
        addNavigationBarButton(at: .right, with: Resources.Strings.Progress.navigationBarRight)
        
        dailyPerformanceView.configure(with: [.init(value: "1", heightMultiplier: 0.2, title: "Mon"),
                                                     .init(value: "2", heightMultiplier: 0.4, title: "Teu"),
                                                     .init(value: "3", heightMultiplier: 0.6, title: "Wen"),
                                                     .init(value: "4", heightMultiplier: 0.8, title: "Thu"),
                                                     .init(value: "5", heightMultiplier: 1, title: "Fri"),
                                                     .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
                                                     .init(value: "2", heightMultiplier: 0.4, title: "Sun")])
    }
}
