//
//  StocksAPI.swift
//  WatchStocks
//
//  Created by Tope Abayomi on 02/02/2015.
//  Copyright (c) 2015 App Design Vault. All rights reserved.
//

import Foundation


class StocksAPI {
    
    func loadStocks(completion: (([Stock]) -> Void)!){
        
        var query = "http://query.yahooapis.com/v1/public/yql?q="
        query += "select * from yahoo.finance.quotes where symbol in (\"YHOO\",\"AAPL\",\"GOOG\",\"MSFT\")"
        query += "&format=json&env=http://datatables.org/alltables.env"
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: query.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        
        var task = session.dataTaskWithURL(url!){
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                var stocksData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as NSDictionary
                
                let query = stocksData["query"] as NSDictionary
                let results = query["results"] as NSDictionary
                let quotes = results["quote"] as NSArray
                
                var stocks = [Stock]()
                
                for quote in quotes {
                    let stock = Stock(data: quote as NSDictionary)
                    stocks.append(stock)
                }
                
                completion(stocks)
            }
        }
        
        task.resume()
    }
}