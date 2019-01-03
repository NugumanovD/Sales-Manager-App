//
//  ProductListForInvoiceController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit
import Foundation

class ProductListForInvoiceController: UITableViewController {
    
    let worker = FireBaseWorker()
    var itemArray = [MainBase]()
    
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
        cell.titel.text = worker.catalog[indexPath.row].titel
        cell.quantity.text = "\(worker.catalog[indexPath.row].quantity)"
        cell.price.text = worker.catalog[indexPath.row].price
        
        cell.count.isHidden = true
        
        if let imageURL = URL(string: worker.catalog[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageProduct.image = image
                        
                    }
                }
            }
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
                print(worker.catalog[indexPath.row])
                itemArray.append(worker.catalog[indexPath.row])
                
            }
        }
    }
    
    
    
    @IBAction func done(_ sender: Any) {
        let array = ProductListDetailController()
        array.itemArray = self.itemArray
        print(itemArray)
        navigationController?.dismiss(navigationController: self.navigationController!)
    }
    
    
}
