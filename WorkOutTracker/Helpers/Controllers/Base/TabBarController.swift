//
//  TabBarController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverViewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigationController = NavigationBarController(rootViewController: overviewController)
        let sessionNavigationController = NavigationBarController(rootViewController: sessionController)
        let progressNavigationController = NavigationBarController(rootViewController: progressController)
        let settingsNavigationController = NavigationBarController(rootViewController: settingsController)
        
        overviewNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview, image: Resources.Images.TabBar.overview, tag: Tabs.overview.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.session, image: Resources.Images.TabBar.session, tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progress, image: Resources.Images.TabBar.progress, tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings, image: Resources.Images.TabBar.settings, tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
        ], animated: false)
    }
}
