//
//  IntroScrollViewController.swift
//  Currencies
//
//  Created by user on 12/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class IntroScrollViewController: UIPageViewController {
    
    weak var introDelegate: IntroScrollViewControllerDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.showNewViewController("One"), self.showNewViewController("Two"), self.showNewViewController("Three")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        introDelegate?.introPageViewController(introPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    //MARK: - scroll next VC
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(viewController: nextViewController)
        }
    }
    
    //MARK: - scroll to VC
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    
    func showNewViewController(_ number: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(number)ViewController")
    }
    
    //MARK: - scroll to VC
    private func scrollToViewController(viewController: UIViewController, direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController], direction: direction, animated: true, completion: { (finished) -> Void in self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.firstIndex(of: firstViewController) {
            introDelegate?.introPageViewController(introPageViewController: self, didUpdatePageIndex: index)
        }
    }
}


extension IntroScrollViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
}

protocol IntroScrollViewControllerDelegate: class {
    
    func introPageViewController(introPageViewController: IntroScrollViewController, didUpdatePageCount count: Int)
    func introPageViewController(introPageViewController: IntroScrollViewController, didUpdatePageIndex index: Int)
}
