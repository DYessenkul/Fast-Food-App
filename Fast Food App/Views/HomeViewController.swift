//
//  HomeViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    static let storyboardIdentifier = "HomeViewController"
    
    @IBOutlet weak var slogan: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    
    
    var restaurants: [Restaurants] = [Restaurants(name: "KFC", image: "kfc", rating: "96%(2523)", deliveryTime: "10-20 min"), Restaurants(name: "McDonald's", image: "mcdonalds", rating: "93%(5538)", deliveryTime: "10-20 min"), Restaurants(name: "Dodo Pizza", image: "dodo", rating: "90%(3237)", deliveryTime: "25-35 min"), Restaurants(name: "Burger King", image: "king", rating: "88%(2110)", deliveryTime: "20-30 min")]
    
    var pizza: [Products] =
    [Products(name: "Cheese Pizza", price: 11, image: "pizza4", restaurant: "Dodo Pizza"),
     Products(name: "Delight Pizza", price: 9, image: "pizza2",restaurant: "Dodo Pizza"),
     Products(name: "Pastry Pizza", price: 10, image: "pizza1",restaurant: "Dodo Pizza"),
     Products(name: "Pepperoni", price: 12, image: "pizza5",restaurant: "Dodo Pizza"),
     Products(name: "Salami Pizza", price: 8, image: "pizza3",restaurant: "Dodo Pizza"),
     Products(name: "Tomato Pizza", price: 10, image: "pizza6",restaurant: "Dodo Pizza")]
    
    var burgerKing: [Products] =
    [Products(name: "Chicken Burger Combo", price: 19, image: "king1",restaurant: "Burger King"),
     Products(name: "Humburger", price: 6, image: "king2", restaurant: "Burger King"),
     Products(name: "King Box", price: 15, image: "king3",restaurant: "Burger King"),
     Products(name: "Cheese burger", price: 8, image: "king4",restaurant: "Burger King"),
     Products(name: "Bacon Burger", price: 9, image: "king5",restaurant: "Burger King")]
 
    
    var mcDonalds: [Products] =
    [Products(name: "Cheese Burger Combo", price: 15, image: "mcdonalds1",restaurant: "McDonald's"),
     Products(name: "Combo Chicken Burger", price: 18, image: "mcdonalds2",restaurant: "McDonald's"),
     Products(name: "Cheese Burger", price: 9, image: "mcdonalds3",restaurant: "McDonald's"),
     Products(name: "Big Burger", price: 12, image: "mcdonalds4",restaurant: "McDonald's"),
     Products(name: "Chicken Burger", price: 12, image: "mcdonalds5",restaurant: "McDonald's")]
    
    var kfc: [Products] =
    [Products(name: "Friends Box", price: 18, image: "kfc1", restaurant: "KFC"),
     Products(name: "Basket", price: 12, image: "kfc2",restaurant: "KFC"),
     Products(name: "Roller Box", price: 16, image: "kfc3",restaurant: "KFC"),
     Products(name: "Twister", price: 15, image: "kfc4",restaurant: "KFC"),
     Products(name: "Sanders Mega Burger", price: 19, image: "kfc5",restaurant: "KFC")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let people = realm.objects(User.self)
        slogan.text = "Hello, \(DataManager.shared.onlineUser)"

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeTableViewCell
        cell.rating.text = restaurants[indexPath.row].rating
        cell.deliveryTime.text = restaurants[indexPath.row].deliveryTime
        cell.restaurantName.text = restaurants[indexPath.row].name
        cell.restaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as?
        MenuViewController
        if indexPath.row == 0{
            menuVC?.products = kfc
            menuVC?.restName = "KFC"
        }
        else if indexPath.row == 1{
            menuVC?.products = mcDonalds
            menuVC?.restName = "McDonalds's"
        }
        else if indexPath.row == 2{
            menuVC?.products = pizza
            menuVC?.restName = "Dodo Pizaa"
        }
        else if indexPath.row == 3{
            menuVC?.products = burgerKing
            menuVC?.restName = "Burger King"
        }
            self.navigationController?.pushViewController(menuVC!, animated: true)
        
        
    }


}
