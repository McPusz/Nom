//
//  StoryboardManager.swift
//  Nom
//
//  Created by Magdusz on 28.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import UIKit

struct StoryboardManager {
    
    
    static func viewController<T: UIViewController>(_ type: T.Type, withIdentifier viewControllerIdentifier: String, fromStoryboard storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
    }
    
    static func dayViewController(forDayNumber dayNumber: Int) -> DayViewController {
        let dayViewController = viewController(DayViewController.self, withIdentifier: "DayViewController", fromStoryboard: "Day")
        dayViewController.dayNumber = dayNumber
        return dayViewController
    }
}
