//
//  ProductListForBasket.swift
//  SaleManager
//
//  Created by Nugumanov Dmitry on 1/2/19.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class ProductListForBasket: UITableViewController {
    
    let worker = FireBaseWorker()
    let testValue = ProductListForInvoiceController()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.customeStule(tableView: tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testValue.itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! ProductListForBasketCustomCell

        cell.basketImageView.image = UIImage(named: "shopping")
        cell.basketTitleLabel.text = testValue.itemArray[indexPath.row]
        return cell
    }
    
}
