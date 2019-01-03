//
//  SalesListController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 15.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class SalesListController: UIViewController {
    
    // MARK: Interface outlets
    @IBOutlet var mainTable: UITableView!
    @IBOutlet weak var filter: UIBarButtonItem!
    
    // MARK: Instance variables/constants
    let worker = FireBaseWorker()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        worker.getDataSales(tableView: mainTable)
        
        
//        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: "filter"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//
//        let barButton = UIBarButtonItem(customView: button)
//        barButton.width = 1
//        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    //MARK: Action funcs
    
    @IBAction func filterButton(_ sender: Any) {
    }
    
    //MARK: public funcs
    
  
    
}

extension SalesListController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worker.sales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = worker.sales[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Отменить") { (action, indexPath) in
            //TODO: make a question!
            self.worker.deletDataSales(indexPath: indexPath)
            tableView.reloadData()
        }
        let archive = UITableViewRowAction(style: .default, title: "В архив") { (action, indexPath) in
            //TODO: make a question!
            print("В архив")
        }
        
        
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        archive.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return [delete,archive]
    }
    
}
