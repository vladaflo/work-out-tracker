//
//  Resources.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#4378FE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
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
            static var navigationBarStart = "Start"
            static let navigationBarPause = "Pause"
            static var navigationBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"
            
            static let workoutStats = "Workout stats"
            static let avarageRate = "Avarage Rate"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total Distance"
            static let totalSteps = "Total Steps"
            
            static let stepsCounter = "Steps Counter"
            
        }
        
        enum Progress {
            static var navigationBarLeft = "Export"
            static var navigationBarRight = "Details"
            
            
            static let dailyPerformance = "Daily Performance"
            static let monthlyPerformance = "Monthly Performance"
            static let last7Days = " Last 7 days"
            static let last10Months = " Last 10 months"
        }
        
        enum Settings {}
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
            static let downArrow = UIImage(named: "down_arrow")
            static let addButton = UIImage(named: "add_button")
        }
        
        enum Overview {
            static let checkmarkNotDone = UIImage(named: "checkmark_not_done")
            static let checkmarkDone = UIImage(named: "checkmark_done")
            static let rightArrow = UIImage(named: "right_arrow")
        }
        
        enum Session {
            enum Stats {
                static let averagePace = UIImage(named: "stats_average_pace")
                static let heartRate = UIImage(named: "stats_heart_rate")
                static let totalDistance = UIImage(named: "stats_total_distance")
                static let totalSteps = UIImage(named: "stats_total_steps")
            }
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
