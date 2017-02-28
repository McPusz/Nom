//
//  DaysViewController.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController {

    
    @IBOutlet weak var pageControl: UIPageControl!
    
    fileprivate var delegate: DaysPageViewControllerDelegate?
    fileprivate var daysPageViewController: DaysPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPageController" {
            let destinationViewController = segue.destination as! DaysPageViewController
            daysPageViewController = destinationViewController
            daysPageViewController.daysPageVCDelegate = self
        }
//        if let destinationViewController = segue.destination as? DaysPageViewController {
//            daysPageViewController = destinationViewController
//            daysPageViewController.daysPageVCDelegate = self
//        }
    }
    
    fileprivate func movePageControlTo(_ index: Int) {
        UIView.animate(withDuration: 0.3) {
            self.pageControl.currentPage = index
//            if index == self.pageControl.numberOfPages - 1 {
//                self.nextButton.setTitle("All clear!", for: .normal)
//            } else {
//                self.nextButton.setTitle("next", for: .normal)
//            }
        }
    }
}

extension DaysViewController: DaysPageViewControllerDelegate {
    func daysPageViewController(daysPageViewController: DaysPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func daysPageViewController(daysPageViewController customerPreferencesPageViewController: DaysPageViewController,
                                    didUpdatePageIndex index: Int) {
        self.movePageControlTo(index)
    }
}
