//
//  ManagerAccountController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 09.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
    let tabBarCnt = UITabBarController()
    var startIndex = 1
    lazy var worker = FireBaseWorker()
    
    
    //MARK: UIViewController lifecycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("2")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("3")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //worker.userCheck()
        createTabBarController()
        //tabBarCnt.selectedIndex = startIndex
    }
    

    func createTabBarController() {
    
        let product = createNavController(storyboard: "ProductController", identifier: "ProductController")
        product.tabBarItem.image = UIImage(named: "shopping")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        product.tabBarItem.selectedImage = UIImage(named: "shoppingSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        product.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let manager = createNavController(storyboard: "ManagerAccountController", identifier: "ManagerAccountController")
        manager.tabBarItem.image = UIImage(named: "profile")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        manager.tabBarItem.selectedImage = UIImage(named: "profileSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        manager.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let controllerArray = [product, manager]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        self.view.addSubview(tabBarCnt.view)
    }
    
    func createNavController(storyboard: String, identifier: String) -> UIViewController {
        var viewController = UIViewController()
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    
}

