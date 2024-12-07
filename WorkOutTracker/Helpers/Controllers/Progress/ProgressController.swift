//
//  ProgressController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Workout Progress"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title (for: .progress)
        
        addNavigationBarButton(at: .left, with: "Export")
        addNavigationBarButton(at: .right, with: "Details")
    }
}
