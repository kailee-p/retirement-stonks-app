//
//  Stock.swift
//  Retirement Stonks App
//
//  Created by Kailee Pedersen on 7/20/21.
//

import UIKit

class Stock: NSObject {
    var stock_name: String
    var price: Double
    
    init(stock_name: String, price: Double) {
        self.stock_name = stock_name
        self.price = price
    }
}
