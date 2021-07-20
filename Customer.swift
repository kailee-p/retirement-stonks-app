//
//  Customer.swift
//  Retirement Stonks App
//
//  Created by Kailee Pedersen on 7/20/21.
//

import UIKit

class Customer: NSObject {
    var customer_id: Int
    var customer_name: String
    var investments: Array<Investment>
    
    init(customer_id: Int, customer_name: String, investments: Array<Investment>) {
        self.customer_id = customer_id
        self.customer_name = customer_name
        self.investments = investments
    }
}
