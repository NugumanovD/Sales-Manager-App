//
//  NewSaleController.swift
//  SaleManager
//
//  Created by Mac on 12.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewSaleController: UITableViewController {
    
    // MARK: Interface outlets
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var telField: UITextField!
    @IBOutlet var postField: UITextField!
    @IBOutlet var commentField: UITextField!
    
    // MARK: Instance variables/constants
    let worker = FireBaseWorker()
    
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: Configurations
    //func configureUI()
    
    
    //MARK: Action funcs

    
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        switch (indexPath.section, indexPath.row) {
        case (1,0):
            //TODO: Verification
            worker.saveDataSales(surname: surnameField.text!, name: nameField.text!, tel: telField.text!, post: postField.text!)
            navigationController?.dismiss(navigationController: self.navigationController!)
        default:
            print("Default")
        }
        
    }
    
    //MARK: Any other protocol
    //func myFuncFromOtherProtocol()
    
    //MARK: Navigation
    
}


