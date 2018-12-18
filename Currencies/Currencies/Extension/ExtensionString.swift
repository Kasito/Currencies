//
//  ExtensionString.swift
//  Currencies
//
//  Created by user on 12/10/18.
//  Copyright © 2018 user. All rights reserved.
//
import Foundation

extension String{
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
