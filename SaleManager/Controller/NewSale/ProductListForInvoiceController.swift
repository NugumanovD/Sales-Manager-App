//
//  ProductListForInvoiceController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit
import Foundation

protocol CanRecieve {
    func recieveData(data: [MainBase])
}

class ProductListForInvoiceController: UITableViewController {
    
    let worker = FireBaseWorker()
    var itemArray = [MainBase]()
    var delegate: CanRecieve?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worker.getDataCatalog(tableView: self.tableView)
        tableView.customeStule(tableView: self.tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worker.catalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NameProductListForInvoiceCellCustome
        
        cell.configureTitle(data: worker.catalog[indexPath.row].titel)
        cell.configureQuantity(data: worker.catalog[indexPath.row].quantity)
        cell.configurePrice(data: worker.catalog[indexPath.row].price)
        cell.configureImage(dataImage: worker.catalog[indexPath.row].image)

//        cell.count.isHidden = false
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
                print(worker.catalog[indexPath.row].titel)

                itemArray.append(worker.catalog[indexPath.row])
            }
        }
    }
    
    @IBAction func done(_ sender: Any) {
        delegate?.recieveData(data: itemArray)
        navigationController?.dismiss(navigationController: self.navigationController!)
    }
    
}
