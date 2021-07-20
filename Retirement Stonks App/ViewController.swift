//
//  ViewController.swift
//  Retirement Stonks App
//
//  Created by Kailee Pedersen on 7/20/21.
//

import UIKit

class ViewController: UIViewController {

    var customerSearch: UITextField!
    var submitButton: UIButton!
    var customerLabel: UILabel!
    var stocksLabel: UILabel!
    var accountValueLabel: UILabel!
    
    //customer instances
    var neil = Customer(customer_id: 1, customer_name: "Neil Merritt", investments: [Investment(stock_name: "VTI", shares_owned: 10), Investment(stock_name: "EES", shares_owned: 100)])
    var denise = Customer(customer_id: 2, customer_name: "Denise Bauer", investments: [Investment(stock_name: "VTI", shares_owned: 10), Investment(stock_name: "EES", shares_owned: 300), Investment(stock_name: "JJH", shares_owned: 20), Investment(stock_name: "GES", shares_owned: 62)])
    var taniya = Customer(customer_id: 3, customer_name: "Taniya Choi", investments: [Investment(stock_name: "AES", shares_owned: 203)])
        
    //stock instances
    var stock_VTI = Stock(stock_name: "VTI", price: 40)
    var stock_EES = Stock(stock_name: "EES", price: 30.5)
    var stock_JJH = Stock(stock_name: "JJH", price: 350)
    var stock_GES = Stock(stock_name: "GES", price: 500)
    var stock_AES = Stock(stock_name: "AES", price: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text field for searching client by name
        customerSearch = UITextField(frame: CGRect(x: 0, y: 200, width: self.view.frame.width * 0.75, height: 50))
        customerSearch.center.x = view.center.x
        customerSearch.placeholder = "Search for customer by name"
        customerSearch.borderStyle = UITextField.BorderStyle.line
        customerSearch.backgroundColor = UIColor.white
        customerSearch.contentVerticalAlignment = .center
        customerSearch.textAlignment = .center
        customerSearch.textColor = UIColor.black
        self.view.addSubview(customerSearch)
        
        //button to submit search
        submitButton = UIButton(frame: CGRect(x: 0, y: 275, width: self.view.frame.width * 0.33, height: 40))
        submitButton.backgroundColor = UIColor(red: 0, green: 0.8078, blue: 0.3765, alpha: 1.0) /* #00ce60 */
        submitButton.setTitle("Submit", for: .normal)
        submitButton.center.x = view.center.x
        submitButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
        //label for customer id and name
        customerLabel = UILabel(frame: CGRect(x: 0, y: 350, width: self.view.frame.width * 0.9, height: 50))
        customerLabel.center.x = view.center.x
        customerLabel.textAlignment = .center
        customerLabel.contentMode = .scaleToFill
        customerLabel.numberOfLines = 0
        self.view.addSubview(customerLabel)
        
        //label for owned stock information
        stocksLabel = UILabel(frame: CGRect(x: 0, y: 420, width: self.view.frame.width * 0.9, height: 100))
        stocksLabel.center.x = view.center.x
        stocksLabel.textAlignment = .center
        stocksLabel.contentMode = .scaleToFill
        stocksLabel.numberOfLines = 0
        stocksLabel.isHidden = true
        self.view.addSubview(stocksLabel)
        
        //label for account value information
        accountValueLabel = UILabel(frame: CGRect(x: 0, y: 540, width: self.view.frame.width * 0.9, height: 50))
        accountValueLabel.center.x = view.center.x
        accountValueLabel.textAlignment = .center
        accountValueLabel.contentMode = .scaleToFill
        accountValueLabel.numberOfLines = 0
        accountValueLabel.isHidden = true
        self.view.addSubview(accountValueLabel)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let customers = [
            "Neil Merritt": neil,
            "Denise Bauer": denise,
            "Taniya Choi": taniya
        ]
        let stocks = [
            "VTI": stock_VTI,
            "EES": stock_EES,
            "JJH": stock_JJH,
            "GES": stock_GES,
            "AES": stock_AES,
        ]
        
        //check for corresponding name from search query in customer dictionary
        if (customers[customerSearch.text!] != nil) {
            
            //display customer information in customer label
            let customerResult: Customer? = customers[customerSearch.text!]
            let customerID = customerResult!.customer_id
            let customerName = customerResult!.customer_name
            customerLabel.text = "Customer ID: \(customerID) | Customer Name: \(customerName)"
            
            //display stocks information in stocks label
            var stocksMsg = "Currently Owning: "
            //array of stock values
            var stockValsArr = [Double]()
            
            //iterate through investements to create string
            for investment in customerResult!.investments {
                let stockName = investment.stock_name
                let sharesOwned = investment.shares_owned
                let totalValStock = stocks[investment.stock_name]!.price * Double(sharesOwned)
                
                //append the total val of each stock to array
                stockValsArr.append(totalValStock)
                
                stocksMsg += "\(stockName) - \(sharesOwned) - Total Value: $\(String(format: "%.2f", totalValStock))"
                
                //append comma and space if not at the end of the array
                if investment != customerResult!.investments.last {
                    stocksMsg += ", "
                }
            }
            stocksLabel.text = stocksMsg
            
            //display account value information in account value label
            let totalAccountVal = stockValsArr.reduce(0, +)
            let totalValMsg = "Total Account Value: $\(String(format: "%.2f", totalAccountVal))"
            accountValueLabel.text = totalValMsg
            
            //unhide labels
            stocksLabel.isHidden = false
            accountValueLabel.isHidden = false
            
        } else {
            customerLabel.text = "No customer by that name found. Please try again."
            
            //hide account info labels
            stocksLabel.isHidden = true
            accountValueLabel.isHidden = true
        }
        
    }
    
}

