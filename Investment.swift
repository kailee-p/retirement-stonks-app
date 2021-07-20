//
//  Investment.swift
//  Retirement Stonks App
//
//  Created by Kailee Pedersen on 7/20/21.
//

import UIKit

class Investment: NSObject {
    var stock_name: String
    var shares_owned: Int
    
    init(stock_name: String, shares_owned: Int) {
        self.stock_name = stock_name
        self.shares_owned = shares_owned
    }
}
