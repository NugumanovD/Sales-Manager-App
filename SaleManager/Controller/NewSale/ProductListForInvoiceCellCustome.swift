//
//  ProductListForInvoiceCellCustome.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class NameProductListForInvoiceCellCustome: UITableViewCell {
    
    @IBOutlet private var titel: UILabel!
    @IBOutlet private var quantity: UILabel!
    @IBOutlet private var price: UILabel!
    @IBOutlet private var imageProduct: UIImageView!
    @IBOutlet weak var addProduct: UIButton!
    @IBOutlet weak var count: UILabel!
    
    
    func configureTitle(data: String) {
        titel.text = data
    }
    
    func configureQuantity(data: Int) {
        quantity.text = String(data)
    }
    
    func configurePrice(data: String) {
        price.text = data
    }
    
    func configureImage(dataImage: String) {
        guard let imageURL = URL(string: dataImage) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageProduct.image = image
            }
        }
    }
    
    
}
