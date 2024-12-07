//
//  Resources.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#4378FE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var background = UIColor(hexString: "#F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var secondary = UIColor(hexString: "#F0F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavigationBar {
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum OverView {
            static var allWorkoutsButton = "All Workouts"
        }
        
        enum Session {
            static var navigationBarLeft = "Pause"
            static var navigationBarRight = "Finish"
        }
        
        enum Progress {
            static var navigationBarLeft = "Export"
            static var navigationBarRight = "Details"
        }
        
        enum Settings {
            
        }
    }
        
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "session_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }
            
            enum Common {
                static var downArrow = UIImage(named: "down_arrow")
                static var addButton = UIImage(named: "add_button")
            }
        }
        enum Fonts {
            static func helveticaRegular(with size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica", size: size) ?? UIFont()
            }
        }
    }
