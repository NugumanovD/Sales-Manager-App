//
//  MainBase.swift
//  SaleManager
//
//  Created by Mac on 08.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import Firebase

struct Sales {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let surname: String
    let tel: String
    let city: String
    let post: String
    let items: [String]
    let isCompleted: Bool
    
    init(name: String, surname: String, tel: String, city: String, post: String, items: [String], isCompleted: Bool, key: String = "") {
        self.ref = nil
        self.key = key
        self.name = name
        self.surname = surname
        self.tel = tel
        self.city = city
        self.post = post
        self.items = items
        self.isCompleted = isCompleted
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let surname = value["surname"] as? String,
            let tel = value["tel"] as? String,
            let city = value["city"] as? String,
            let post = value["post"] as? String,
            let items = value["items"] as? [String],
            let isCompleted = value["isCompleted"] as? Bool
            else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.surname = surname
        self.tel = tel
        self.city = city
        self.post = post
        self.items = items
        self.isCompleted = isCompleted

    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "surname": surname,
            "tel": tel,
            "city": city,
            "post": post,
            "items": items,
            "isCompleted": isCompleted,
        ]
    }
}
