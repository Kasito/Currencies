//
//  InformBankViewController.swift
//  Currencies
//
//  Created by user on 12/7/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class InformBankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameBank: UILabel!
    @IBOutlet weak private var logo: UIImageView!
    @IBOutlet weak private var coursesTableView: UITableView!
    @IBOutlet weak var link: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    private var apiGetData = APIGetData()
    private var loadImage = LoadImage()
    private var InformBank = UITableViewCell()
    var data: [String: String] = [:]
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarStyle(.lightContent)
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.reloadData()
       
        apiGetData.getData(searchTerm: apiGetData.link) { result in
            if  result != nil {
                self.apiGetData.bankResults = result!
                self.coursesTableView.reloadData()
            }
        }
        
        loadImage.loadLogoImage(nameBank: data["title"] ?? "") { result in
            if let result = result {
                self.logo.image = result
            }
        }
        
       nameBank.text = data["title"]
        link.text = data["link"]
        city.text = data["city"]
        address.text = data["address"]
        phone.text = data["phone"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for i in apiGetData.bankResults {
            count = i.currencies?.count ?? 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformBankTableViewCell
       
        for i in apiGetData.bankResults {
            if let currencies = i.organizations?[indexPath.row].currencies {
            for j in currencies {
                cell.correncies.text = i.currencies?[j.key]
                cell.buy.text = j.value.ask
                cell.sell.text = j.value.bid
                }
            }
            if let key = i.currencies {
                let arreyKey = key.allKeys(forValue: cell.correncies.text ?? "")
                cell.typeCorrencies.text = arreyKey.first
            }
        }
        return cell
    }
}
