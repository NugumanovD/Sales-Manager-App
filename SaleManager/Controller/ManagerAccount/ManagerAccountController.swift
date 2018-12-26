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

class ManagerAccountController: UIViewController {
    
    let chart = ChartController()
    
    @IBOutlet weak var chartView: BarChartView!
    
    let fireBaseWorker = FireBaseWorker()
    
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
    
    
    @IBAction func SaleList(_ sender: Any) {
        transitionToViewController(name: "SalesListController")
    }
    @IBAction func NewSale(_ sender: Any) {
        transitionToViewController(name: "NewSaleController")
    }
    @IBAction func signOutButton(_ sender: Any) {
        signOut()
    }
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
        //Auth.auth().addStateDidChangeListener() { auth, user in
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
                    print(allItem.post)
                }
            }
        })
    }
    
    
}
