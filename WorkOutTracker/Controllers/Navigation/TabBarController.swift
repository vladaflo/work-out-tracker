//
//  TabBarController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    init() {
           super.init(nibName: nil, bundle: nil)
        
        configureAppearance()
        //switchTo(tab: .progress) переключение экранов загрузки
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) is not supported, as Storyboard is not used.")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearance() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavigationBarController] = Tabs.allCases.map { tab in
            let controller = NavigationBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.title(for: tab),
                                                 image: Resources.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview: return OverViewController()
        case .session: return SessionController()
        case .progress: return ProgressController()
        case .settings: return SettingsController()
        }
    }
}
