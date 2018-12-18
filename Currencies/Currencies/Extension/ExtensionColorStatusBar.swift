//
//  ColorStatusBar.swift
//  Currencies
//
//  Created by user on 12/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

extension UIViewController {
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}
