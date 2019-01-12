//
//  ProductListForBasketCustomCell.swift
//  SaleManager
//
//  Created by Nugumanov Dmitry on 1/2/19.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit



class ProductListDetailCustomCell: UITableViewCell {
    
    @IBOutlet private var basketImageView: UIImageView!
    @IBOutlet private var basketTitleLabel: UILabel!
    @IBOutlet private var basketCountLabel: UILabel!
    @IBOutlet private var inStockLabel: UILabel!
    @IBOutlet private var basketPriceLabel: UILabel!
    @IBOutlet private var basketCountPlusButton: UIButton!
    @IBOutlet weak var basketCountMinusButton: UIButton!
    
    var countLabel = 1
    
    func configureTitle(data: String) {
        basketTitleLabel.text = data
    }
    
    func configureBasketPrice(data: String) {
        basketPriceLabel.text = data
    }
    
    func configureQuantity(data: Int) {
        inStockLabel.text = String(data)
        
    }
    
    func configureImage(dataImage: String) {
        guard let imageURL = URL(string: dataImage) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.basketImageView.image = image
            }
        }
    }
    
    
    
    @IBAction func basketCountPlusButtonTapped(_ sender: UIButton) {
        print("Hello")
        
        countPlus(data: countLabel)
    }
    
    @IBAction func basketCountMinusButtonTapped(_ sender: UIButton) {
        print("World")
        
        countMinus(data: countLabel)
    }
    
    
    func countMinus(data: Int) {
        if basketCountLabel.text == "1" || basketCountLabel.text == "0" {
            basketCountMinusButton.isHidden = true
            
        }
        
       countLabel -= 1
        
        print(countLabel)
        DispatchQueue.main.async {
            self.basketCountLabel.text = String(self.countLabel)
            
        }
        
    }
    
    func countPlus(data: Int) {
        countLabel += 1
        basketCountMinusButton.isHidden = false
        print(countLabel)
        DispatchQueue.main.async {
            self.basketCountLabel.text = String(self.countLabel)
        }
    }
    
    
    
    
}

