//
//  InterfaceController.swift
//  WatchStocks WatchKit Extension
//
//  Created by Tope Abayomi on 02/02/2015.
//  Copyright (c) 2015 App Design Vault. All rights reserved.
//

import WatchKit
import Foundation


class AppleDetailController: WKInterfaceController {
    @IBOutlet var nameLabel : WKInterfaceLabel!
    @IBOutlet var askLabel : WKInterfaceLabel!
    @IBOutlet var changeLabel : WKInterfaceLabel!
    @IBOutlet var changeValue : WKInterfaceLabel!
    @IBOutlet var capLabel : WKInterfaceLabel!
    @IBOutlet var capValue : WKInterfaceLabel!

   
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let api = StocksAPI()
        api.loadStocks(stocksLoaded(stocksLoaded))
    }
    

    func stocksLoaded(loadedStocks: [Stock]) {
        if loadedStocks.count > 0 {
            setupUI(loadedStocks[0])
        }
        
    }
    
    func setupUI(stock: Stock) {
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
