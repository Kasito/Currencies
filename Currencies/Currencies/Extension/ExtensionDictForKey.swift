//
//  ExtensionDictForKey.swift
//  Currencies
//
//  Created by user on 12/10/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}
