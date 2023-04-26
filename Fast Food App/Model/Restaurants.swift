//
//  Restaurants.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import Foundation


struct Restaurants{
    let name: String
    let image: String
    let rating: String
    let deliveryTime: String
}

struct Products{
    let name: String
    let price: Int
    let image: String
    let restaurant: String
}

class DataManager{
    static let shared = DataManager()
    var basketArray: [Products] = []
    var onlineUser: String = ""
}
