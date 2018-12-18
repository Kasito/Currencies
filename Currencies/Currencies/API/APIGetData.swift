//
//  APIGetData.swift
//  Currencies
//
//  Created by user on 12/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class APIGetData {
    
    var bankResults = [CurrencyCash]()
    
    var link = "http://resources.finance.ua/ua/public/currency-cash.json"
    
    //MARK: - Get DATA
    func getData(searchTerm: String, completion: @escaping ([CurrencyCash]?) -> ()) {
        guard let url = URL(string: searchTerm) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(CurrencyCash.self, from: data)
                DispatchQueue.main.async {
                    completion([json])
                }
            } catch {
                print("\(error)")
            }
            }.resume()
    }
}
