//
//  dialNumber.swift
//  Currencies
//
//  Created by user on 12/12/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class DialNumber: NSObject {
    func dialNumber(number: String) {
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
}
