//
//  ConverterLab.swift
//  Currencies
//
//  Created by user on 12/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

final class ConverterLab: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak private var bankTabelView: UITableView!
    private var bankCell = UITableViewCell()
    
    private var apiGetData = APIGetData()
    private var loadImage = LoadImage()
    private var dialNumber = DialNumber()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarStyle(.lightContent)
        
        bankTabelView.delegate = self
        bankTabelView.dataSource = self
        
        bankTabelView.reloadData()
        
        apiGetData.getData(searchTerm: apiGetData.link) { result in
            if  result != nil {
                self.apiGetData.bankResults = result!
                self.bankTabelView.reloadData()
            }
        }
    }
    
    @IBAction func Cancel(segue: UIStoryboardSegue) {
    }
    
    @IBAction func safariButton(_ sender: UIButton) {
        for i in apiGetData.bankResults {
            if let link = i.organizations?[sender.tag].link {
                showSafari(url: link)
            }
        }
    }
    
    @IBAction func phoneButton(_ sender: UIButton) {
        for i in apiGetData.bankResults {
            if let phone = i.organizations?[sender.tag].phone {
                dialNumber.dialNumber(number: phone)
            }
        }
    }
    
    @IBAction func mapButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapVC") as! MapViewController
        for i in apiGetData.bankResults {
            if let idCity = i.organizations?[sender.tag].cityID {
                if let city  = i.cities?[idCity], let address  = i.organizations?[sender.tag].address  {
                    viewController.address = city + " " + address
                }
            }
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func showMoreInform(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowInform") as! InformBankViewController
        for i in apiGetData.bankResults {
            if let idCity = i.organizations?[sender.tag].cityID {
                viewController.data["city"] = i.cities?[idCity]
            }
            viewController.data["address"] = i.organizations?[sender.tag].address
            viewController.data["title"] = i.organizations?[sender.tag].title
            viewController.data["phone"] = i.organizations?[sender.tag].phone
            viewController.data["link"] = i.organizations?[sender.tag].link
        }
        self.present(viewController, animated: false, completion: nil)
    }
    
    //MARK: - showSafari
    private func showSafari(url: String) {
        let urlStr = URL(string: url)
        if let urlStr = urlStr {
            let svc = SFSafariViewController(url: urlStr)
            present(svc, animated: true, completion: nil)
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for i in apiGetData.bankResults {
            count = i.organizations?.count ?? 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConverterLabCell
        for i in apiGetData.bankResults {
            if let idRegion = i.organizations?[indexPath.row].regionID {
                cell.region.text = i.regions?[idRegion]
            }
            if let idCity = i.organizations?[indexPath.row].cityID {
                cell.city.text = i.cities?[idCity]
            }
            cell.address.text = i.organizations?[indexPath.row].address
            cell.nameBank.text = i.organizations?[indexPath.row].title
            cell.phone.text = i.organizations?[indexPath.row].phone
            cell.siteButton.tag = indexPath.row
            cell.phoneButton.tag = indexPath.row
            cell.mapButton.tag = indexPath.row
            cell.showInformButton.tag = indexPath.row
            if let title = i.organizations?[indexPath.row].title {
                loadImage.loadLogoImage(nameBank: title) { result in
                    if let result = result {
                        cell.logo.image = result
                    }
                }
            }
            
        }
        return cell
    }
}
