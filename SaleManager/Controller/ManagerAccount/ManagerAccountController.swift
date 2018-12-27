//
//  ManagerAccountController.swift
//  SaleManager
//
//  Created by Mac on 09.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Charts

class ManagerAccountController: UITableViewController {
    
    // MARK: Interface outlets
    
    @IBOutlet weak var chartView: BarChartView!
    
    // MARK: Instance variables/constants
    
    let fireBaseWorker = FireBaseWorker()
    let chart = ChartController()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCheck()
        fireBaseWorker.chartDB()
        chartView.contentMode = .scaleAspectFit
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //userCheck()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userCheck()
        chart.drawChart(chartView)
    }
    
    //MARK: Configurations
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            Status.shared.loginStatus = false
            transitionToViewController(name: "AuthStoryboard")
        } catch (let error) {
            print("Auth sign out failed: \(error)")
        }
    }
    
    func userCheck() {
        if Status.shared.loginStatus {
            print("MyAccount Логин получен")
        } else {
            print("MyAccount Пользователя с таким логином нет, идем на регистрацию")
            transitionToViewController(name: "AuthStoryboard")
        }
    }
    
    func getData() {
        let worker = fireBaseWorker.salesRef
        print(worker)
        
        worker.observe(.value, with: { snapshot in
            var newItems: [Sales] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = Sales(snapshot: snapshot) {
                    newItems.append(allItem)
                    print(allItem.key)
                }
            }
        })
    }
    
    //MARK: Action funcs
    
    @IBAction func SaleList(_ sender: Any) {
        transitionToViewController(name: "SalesListController")
    }
    @IBAction func NewSale(_ sender: Any) {
        transitionToViewController(name: "NewSaleController")
    }
    @IBAction func signOutButton(_ sender: Any) {
        signOut()
    }
    
    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.textLabel?.text = "xz"
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        if indexPath.section == 1 && indexPath.row == 0 {
            transitionToViewController(name: "NewSaleController")
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            transitionToViewController(name: "SalesListController")
        }
        
        if indexPath.section == 2 && indexPath.row == 0 {
            //TODO: Need to make a question!
            signOut()
        }
        
        
        
    }
    
    
    
    
    // MARK: - Navigation
    
    
    
}
