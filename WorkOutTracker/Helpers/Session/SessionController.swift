//
//  SessionController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

final class SessionController: BaseController {
    private let timerView = TimerView()
    private let statsView = StatsView(with: Resources.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: Resources.Strings.Session.stepsCounter)
    
    private let timerDuration = 15.0
    
    func navigationBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        addNavigationBarButton(at: .left,
        with: timerView.state == .isRuning
                               ? Resources.Strings.Session.navigationBarPause : Resources.Strings.Session.navigationBarStart
    )
    }
    
    func navigationBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        addNavigationBarButton(at: .left, with: Resources.Strings.Session.navigationBarStart)
    }
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavigationBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        addNavigationBarButton(at: .left, with: Resources.Strings.Session.navigationBarStart)
        addNavigationBarButton(at: .right, with: Resources.Strings.Session.navigationBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.0)
        timerView.callBack = { [weak self] in
            self?.navigationBarRightButtonHandler()
        }
        
        statsView.configure(with: [.heartRate(value: "155"),
                                           .avarageRate(value: "8'20''"),
                                           .totalSteps(value: "7,682"),
                                           .totalDistances(value: "8.25")])
        
        stepsView.configure(with: [ .init(value: "8k", heightMultiplier: 1, title: "2/14"),
                                    .init(value: "7k", heightMultiplier: 0.8, title: "2/15"),
                                    .init(value: "5k", heightMultiplier: 0.6, title: "2/16"),
                                    .init(value: "6k", heightMultiplier: 0.7, title: "2/17")
        ])
    }
}
