//
//  loadImage.swift
//  Currencies
//
//  Created by user on 12/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class LoadImage {
    
    var imageResults = UIImage()
    
    private var fotokUrl = "https://dummyimage.com/%7B55%7Dx%7B40%7D/%7B733b73%7D/%7Bdddeeb%7D&text="
    
    //MARK: - loadImage
    func loadLogoImage(nameBank: String, completion: @escaping (UIImage?) -> ()){
        let arrayName = nameBank.components(separatedBy: " ")
        var char = ""
        for j in arrayName {
            if let firstLetter = j.first {
                char.append(String(firstLetter).uppercased())
            }
        }
        
        let url = URL(string: fotokUrl + char.encodeUrl)
        guard let urls = url else { return }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urls)
            DispatchQueue.main.async {
                if let dataImage = data {
                    let image = (UIImage(data: dataImage))
                    completion(image)
                }
            }
        }
    }    
}


