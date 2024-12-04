//
//  SessionController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 04/12/2024.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavigationBarButton(at: .left, with: "Pause")
        addNavigationBarButton(at: .right, with: "Finish")
    }
    
    override func NavigationBarLeftButtonHandler() {
        print("Session NavBar left button tapped.")
    }
}
