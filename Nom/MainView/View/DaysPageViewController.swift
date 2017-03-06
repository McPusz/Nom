//
//  DaysPageViewController.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

protocol DaysPageViewControllerDelegate: class {
    
    func daysPageViewController(daysPageViewController: DaysPageViewController,
                                    didUpdatePageCount count: Int)

    func daysPageViewController(daysPageViewController: DaysPageViewController,
                                    didUpdatePageIndex index: Int)
    
}

protocol CustomUIPageViewControllerDataSource: UIPageViewControllerDataSource {
    
    func pageViewControllerForIndex(index: Int) -> UIViewController?
    func indexForPageViewController(viewController: UIViewController) -> Int?

}

class DaysPageViewController: UIPageViewController {
    
    private(set) lazy var orderedViewControllers: [DayViewController] = {
        
        let viewModel = DayViewModel()
        var days = [DayViewController]()
        
        for day in 0...(viewModel.getNumberOfDays()-1) {
            let dayNumber = day
            days.append(StoryboardManager.dayViewController(forDayNumber: day))
        }
        
        return days
    }()
    
    weak var daysPageVCDelegate: DaysPageViewControllerDelegate?
    private let viewModel = DayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        let actualDayIndex = viewModel.actualOrNextDayIndex()
        let firstViewController = orderedViewControllers[actualDayIndex]
        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
        daysPageVCDelegate?.daysPageViewController(daysPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
}

extension DaysPageViewController: CustomUIPageViewControllerDataSource {
    
    func pageViewControllerForIndex(index: Int) -> UIViewController? {
        return orderedViewControllers[safe: index]
    }
    
    func indexForPageViewController(viewController: UIViewController) -> Int? {
        return orderedViewControllers.index(of: viewController as! DayViewController)
    }
    
}

extension DaysPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController as! DayViewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController as! DayViewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}

extension CustomUIPageViewControllerDataSource where Self: UIPageViewController {
    
    private func currentIndex() -> Int? {
        guard let currentViewController = viewControllers?.first else { return nil }
        return indexForPageViewController(viewController: currentViewController)
    }
    
    func moveTo(index: Int, animated: Bool) -> Bool {
        
        var direction = UIPageViewControllerNavigationDirection.forward
        
        guard let currentIndex = currentIndex() else {
            return false
        }
        
        if currentIndex == index {
            return false
        } else if currentIndex < index {
            direction = .forward
        } else if currentIndex > index {
            direction = .reverse
        }
        
        guard let destinationViewController = pageViewControllerForIndex(index: index) else {
            return false
        }
        
        setViewControllers([destinationViewController], direction: direction, animated: animated, completion: nil)
        return true
    }
    
    func moveForward(animated: Bool) -> Bool {
        
        guard var currentIndex = currentIndex() else {
            return false
        }
        
        currentIndex += 1
        
        return moveTo(index: currentIndex, animated: animated)
    }
    
    func moveReverse(animated: Bool) -> Bool {
        
        guard var currentIndex = currentIndex() else {
            return false
        }
        currentIndex -= 1
        return moveTo(index: currentIndex, animated: animated)
    }
}

extension DaysPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController as! DayViewController) {
            daysPageVCDelegate?.daysPageViewController(daysPageViewController: self, didUpdatePageIndex: index)
        }
    }
}
