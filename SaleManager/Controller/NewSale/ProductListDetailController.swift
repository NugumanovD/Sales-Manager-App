//
//  ProductListDetailController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class ProductListDetailController: UITableViewController {
    
    // MARK: Type declarations
    //struct/enum/class
    
    // MARK: Class variables/constants
    //static var/let
    
    // MARK: Interface outlets
    //@IBOutlets
    
    // MARK: Instance variables/constants
    //let/var
    
    // MARK: Private instance variables/constants
    //private let/var
    
    // MARK: class functions
    //static func instantiateViewController() -> ViewController
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.customeStule(tableView: self.tableView)
    }
    
    //MARK: Configurations
    //func configureUI()
    
    //MARK: private funcs
    //private func myPrivateFunc()
    
    //MARK: Action funcs
    @IBAction func done(_ sender: Any) {
        navigationController?.dismiss(navigationController: self.navigationController!)
    }
    
    //MARK: public funcs
    //func myPublicFunc()
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    //func tableView(_ tableView: UITableView.....
    
    //MARK: Any other protocol
    //func myFuncFromOtherProtocol()
    
    //MARK: Navigation
    
    
    
    
    
    
    
}
