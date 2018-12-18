//
//  UIPageViewControllerDataSource.swift
//  Currencies
//
//  Created by user on 12/17/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

// MARK: UIPageViewControllerDataSource
extension IntroScrollViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return orderedViewControllers.last }
        guard orderedViewControllers.count > previousIndex else { return nil }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        guard orderedViewControllersCount != nextIndex else { return orderedViewControllers.first }
        guard orderedViewControllersCount > nextIndex else { return nil }
        return orderedViewControllers[nextIndex]
    }
}

extension IntroViewController: IntroScrollViewControllerDelegate {
    
    func introPageViewController(introPageViewController: IntroScrollViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func introPageViewController(introPageViewController: IntroScrollViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
