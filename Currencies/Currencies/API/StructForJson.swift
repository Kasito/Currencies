//
//  StructForJson.swift
//  Currencies
//
//  Created by user on 12/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

struct CurrencyCash: Codable {
    let sourceID: String?
    let organizations: [Organization]?
    let orgTypes: [String: String]?
    let currencies: [String: String]?
    let regions: [String: String]?
    let cities: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case organizations, orgTypes, currencies, regions, cities
    }
}

struct Cities: Codable {
    let the7Oiylpmiow8Iy1Smadm, the7Oiylpmiow8Iy1Smadn, the7Oiylpmiow8Iy1Smadi, the7Oiylpmiow8Iy1Smadr: String?
    let the7Oiylpmiow8Iy1Smadk, the7Oiylpmiow8Iy1Smadx, the7Oiylpmiow8Iy1Smadp, the7Oiylpmiow8Iy1Smadj: String?
    let the7Oiylpmiow8Iy1Smaec: String?
    
    enum CodingKeys: String, CodingKey {
        case the7Oiylpmiow8Iy1Smadm = "7oiylpmiow8iy1smadm"
        case the7Oiylpmiow8Iy1Smadn = "7oiylpmiow8iy1smadn"
        case the7Oiylpmiow8Iy1Smadi = "7oiylpmiow8iy1smadi"
        case the7Oiylpmiow8Iy1Smadr = "7oiylpmiow8iy1smadr"
        case the7Oiylpmiow8Iy1Smadk = "7oiylpmiow8iy1smadk"
        case the7Oiylpmiow8Iy1Smadx = "7oiylpmiow8iy1smadx"
        case the7Oiylpmiow8Iy1Smadp = "7oiylpmiow8iy1smadp"
        case the7Oiylpmiow8Iy1Smadj = "7oiylpmiow8iy1smadj"
        case the7Oiylpmiow8Iy1Smaec = "7oiylpmiow8iy1smaec"
    }
}

struct Currencies: Codable {
    let aed, amd, aud, azn: String?
    let bgn, brl, byn, cad: String?
    let chf, clp, cny, czk: String?
    let dkk, dzd, egp, eur: String?
    let gbp, gel, hkd, hrk: String?
    let huf, ils, inr, iqd: String?
    let jpy, kgs, krw, kwd: String?
    let kzt, lbp, mdl, mxn: String?
    let nok, nzd, pkr, pln: String?
    let ron, rub, sar, sek: String?
    let sgd, thb, tjs, tmt: String?
    let currenciesTRY, twd, usd, vnd: String?
    
    enum CodingKeys: String, CodingKey {
        case aed = "AED"
        case amd = "AMD"
        case aud = "AUD"
        case azn = "AZN"
        case bgn = "BGN"
        case brl = "BRL"
        case byn = "BYN"
        case cad = "CAD"
        case chf = "CHF"
        case clp = "CLP"
        case cny = "CNY"
        case czk = "CZK"
        case dkk = "DKK"
        case dzd = "DZD"
        case egp = "EGP"
        case eur = "EUR"
        case gbp = "GBP"
        case gel = "GEL"
        case hkd = "HKD"
        case hrk = "HRK"
        case huf = "HUF"
        case ils = "ILS"
        case inr = "INR"
        case iqd = "IQD"
        case jpy = "JPY"
        case kgs = "KGS"
        case krw = "KRW"
        case kwd = "KWD"
        case kzt = "KZT"
        case lbp = "LBP"
        case mdl = "MDL"
        case mxn = "MXN"
        case nok = "NOK"
        case nzd = "NZD"
        case pkr = "PKR"
        case pln = "PLN"
        case ron = "RON"
        case rub = "RUB"
        case sar = "SAR"
        case sek = "SEK"
        case sgd = "SGD"
        case thb = "THB"
        case tjs = "TJS"
        case tmt = "TMT"
        case currenciesTRY = "TRY"
        case twd = "TWD"
        case usd = "USD"
        case vnd = "VND"
    }
}

struct Organization: Codable {
    let id: String?
    let oldID, orgType: Int?
    let branch: Bool?
    let title, regionID, cityID, phone: String?
    let address: String?
    let link: String?
    let currencies: [String: Currency]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case oldID = "oldId"
        case orgType, branch, title
        case regionID = "regionId"
        case cityID = "cityId"
        case phone, address, link, currencies
    }
}

struct Currency: Codable {
    let ask, bid: String?
}

struct Regions: Codable {
    let ua7Oiylpmiow8Iy1Smac2, ua7Oiylpmiow8Iy1Smaci, ua7Oiylpmiow8Iy1Smac7, ua7Oiylpmiow8Iy1Smabz: String?
    let ua7Oiylpmiow8Iy1Smack, ua07Oiylpmiow8Iy1Smadi, ua7Oiylpmiow8Iy1Smac9, ua7Oiylpmiow8Iy1Smac0: String?
    let ua7Oiylpmiow8Iy1Smacd, ua7Oiylpmiow8Iy1Smacc, ua7Oiylpmiow8Iy1Smacf, ua7Oiylpmiow8Iy1Smac4: String?
    let ua7Oiylpmiow8Iy1Smacg, ua7Oiylpmiow8Iy1Smac3, ua7Oiylpmiow8Iy1Smacj, ua7Oiylpmiow8Iy1Smach: String?
    let ua7Oiylpmiow8Iy1Smac6, ua7Oiylpmiow8Iy1Smac5, ua7Oiylpmiow8Iy1Smaca: String?
    
    enum CodingKeys: String, CodingKey {
        case ua7Oiylpmiow8Iy1Smac2 = "7oiylpmiow8iy1smac2"
        case ua7Oiylpmiow8Iy1Smaci = "7oiylpmiow8iy1smaci"
        case ua7Oiylpmiow8Iy1Smac7 = "7oiylpmiow8iy1smac7"
        case ua7Oiylpmiow8Iy1Smabz = "7oiylpmiow8iy1smabz"
        case ua7Oiylpmiow8Iy1Smack = "7oiylpmiow8iy1smack"
        case ua07Oiylpmiow8Iy1Smadi = "7oiylpmiow8iy1smadi"
        case ua7Oiylpmiow8Iy1Smac9 = "7oiylpmiow8iy1smac9"
        case ua7Oiylpmiow8Iy1Smac0 = "7oiylpmiow8iy1smac0"
        case ua7Oiylpmiow8Iy1Smacd = "7oiylpmiow8iy1smacd"
        case ua7Oiylpmiow8Iy1Smacc = "7oiylpmiow8iy1smacc"
        case ua7Oiylpmiow8Iy1Smacf = "7oiylpmiow8iy1smacf"
        case ua7Oiylpmiow8Iy1Smac4 = "7oiylpmiow8iy1smac4"
        case ua7Oiylpmiow8Iy1Smacg = "7oiylpmiow8iy1smacg"
        case ua7Oiylpmiow8Iy1Smac3 = "7oiylpmiow8iy1smac3"
        case ua7Oiylpmiow8Iy1Smacj = "7oiylpmiow8iy1smacj"
        case ua7Oiylpmiow8Iy1Smach = "7oiylpmiow8iy1smach"
        case ua7Oiylpmiow8Iy1Smac6 = "7oiylpmiow8iy1smac6"
        case ua7Oiylpmiow8Iy1Smac5 = "7oiylpmiow8iy1smac5"
        case ua7Oiylpmiow8Iy1Smaca = "ua,7oiylpmiow8iy1smaca"
    }
}
