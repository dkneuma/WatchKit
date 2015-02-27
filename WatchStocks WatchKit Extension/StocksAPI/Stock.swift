//
//  Stock.swift
//  WatchStocks
//
//  Created by Tope Abayomi on 02/02/2015.
//  Copyright (c) 2015 App Design Vault. All rights reserved.
//

import Foundation

class Stock {
    
    var symbol : String!
    var companyName: String!
    var ask : String!
    var change : String!
    var marketCap: String!
    var currency: String!
    
    init(data : NSDictionary){
        
        self.symbol = getStringFromJSON(data, key: "Symbol")
        self.companyName = getStringFromJSON(data, key: "Name")
        self.ask = getStringFromJSON(data, key: "Ask")
        self.change = getStringFromJSON(data, key: "Change")
        self.marketCap = getStringFromJSON(data, key: "MarketCapitalization")
        self.currency = getStringFromJSON(data, key: "Currency")
        
    }
    
    func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
}