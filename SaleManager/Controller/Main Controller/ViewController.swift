//
//  ViewController.swift
//  UITabBarController-Tutorial
//
//  Created by Aman Aggarwal on 12/26/17.
//  Copyright © 2017 iostutorialjunction.com. All rights reserved.
//

import UIKit

class Main: UIViewController {

    let tabBarCnt = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabBarCnt.tabBar.tintColor = UIColor.black
        createTabBarController()
        
        //tabBarCnt.selectedIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


      func createTabBarController() {
    
//        let firstVc = UIViewController()
//        firstVc.title = "First"
//        firstVc.view.backgroundColor =  UIColor.red
//        firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "HomeTab"), tag: 0)
        
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

