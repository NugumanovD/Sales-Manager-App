//
//  SalesInformationController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 05/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class SalesInformationController: UITableViewController {
    
    // MARK: Interface outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var itemsTableView: SalesItemsTableView!
    
    // MARK: Instance variables/constants
    var item = [Sales]()
    
    //MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.customeStule(tableView: tableView)
        
        nameLabel.text = item.first?.name
        numberLabel.text = item.first?.tel
        cityLabel.text = item.first?.city
        deliveryLabel.text = item.first?.post

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            return 117
        case (0,1):
            return 70
        case (0,2):
            return 70
        case (1,0):
            return CGFloat(heightCell())
        
        default:
            return 44
        }
        
    }

    func heightCell() -> Int {
        var height = 44
        if let count = item.first?.items.count {
            height = count * 44 * 3
        }
        return height
       
    }
    
   

}
