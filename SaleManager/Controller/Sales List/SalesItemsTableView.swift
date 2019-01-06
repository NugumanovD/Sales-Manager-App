//
//  SalesItemsTableView.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 06/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class SalesItemsTableView: UITableView {
    
    let itemsDelegat = SalesInformationController()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(itemsDelegat.item.first?.items.count)
        
        return itemsDelegat.item.first?.items.count ?? 0
    }
    
}
