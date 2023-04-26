//
//  User.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import Foundation
import RealmSwift

class User: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    let orderHistory = List<Order>()
}


class Order: Object{
    @objc dynamic var date: Date = Date()
    let items = List<Product>()
}

class Product: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var price: Double = 0.0
}
