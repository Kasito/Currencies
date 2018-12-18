//
//  IntroViewController.swift
//  Currencies
//
//  Created by user on 12/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class IntroViewController: UIViewController {
    
    @IBOutlet weak  var pageControl: UIPageControl!
    @IBOutlet weak  var containerView: UIView!
    
    private var introPageViewController: IntroScrollViewController? {
        didSet {
            introPageViewController?.introDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: Selector(("didChangePageControlValue")), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let introPageViewController = segue.destination as? IntroScrollViewController {
            self.introPageViewController = introPageViewController
        }
    }
    
    func didChangePageControlValue() {
        introPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

