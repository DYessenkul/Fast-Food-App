//
//  SearchViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

 

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tabBarControllerRef: UITabBarController?
    
    let searchController = UISearchController()
    var products: [Products] =
    [Products(name: "Cheese Pizza", price: 11, image: "pizza4", restaurant: "Dodo Pizza"),
     Products(name: "Delight Pizza", price: 9, image: "pizza2",restaurant: "Dodo Pizza"),
     Products(name: "Pastry Pizza", price: 10, image: "pizza1",restaurant: "Dodo Pizza"),
     Products(name: "Pepperoni", price: 12, image: "pizza5",restaurant: "Dodo Pizza"),
     Products(name: "Salami Pizza", price: 8, image: "pizza3",restaurant: "Dodo Pizza"),
     Products(name: "Tomato Pizza", price: 10, image: "pizza6",restaurant: "Dodo Pizza"),
     Products(name: "Chicken Burger Combo", price: 19, image: "king1",restaurant: "Burger King"),
     Products(name: "Humburger", price: 6, image: "king2", restaurant: "Burger King"),
     Products(name: "King Box", price: 15, image: "king3",restaurant: "Burger King"),
     Products(name: "Cheese burger", price: 8, image: "king4",restaurant: "Burger King"),
     Products(name: "Bacon Burger", price: 9, image: "king5",restaurant: "Burger King"),
     Products(name: "Cheese Burger Combo", price: 15, image: "mcdonalds1",restaurant: "McDonald's"),
     Products(name: "Combo Chicken Burger", price: 18, image: "mcdonalds2",restaurant: "McDonald's"),
     Products(name: "Cheese Burger", price: 9, image: "mcdonalds3",restaurant: "McDonald's"),
     Products(name: "Big Burger", price: 12, image: "mcdonalds4",restaurant: "McDonald's"),
     Products(name: "Chicken Burger", price: 12, image: "mcdonalds5",restaurant: "McDonald's"),
     Products(name: "Friends Box", price: 18, image: "kfc1", restaurant: "KFC"),
     Products(name: "Basket", price: 12, image: "kfc2",restaurant: "KFC"),
     Products(name: "Roller Box", price: 16, image: "kfc3",restaurant: "KFC"),
     Products(name: "Twister", price: 15, image: "kfc4",restaurant: "KFC"),
     Products(name: "Sanders Mega Burger", price: 19, image: "kfc5",restaurant: "KFC")]
    var filteredProducts = [Products]()
    var isSearching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tabBarControllerRef = tabBarController
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filteredProducts.count
        }
        else{
            return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        if isSearching{
            cell.product = filteredProducts[indexPath.row]
            cell.foodName.text = filteredProducts[indexPath.row].name
            cell.foodImage.image = UIImage(named: filteredProducts[indexPath.row].image)
            cell.foodPrice.text = "$\(filteredProducts[indexPath.row].price).00"
            cell.restaurant.text = "\(filteredProducts[indexPath.row].restaurant)"
            cell.addButton.addTarget(self, action: #selector(addToBasketDidTap), for: .touchUpInside)
        }
        else{
            cell.product = products[indexPath.row]
            cell.foodName.text = products[indexPath.row].name
            cell.foodImage.image = UIImage(named: products[indexPath.row].image)
            cell.foodPrice.text = "$\(products[indexPath.row].price).00"
            cell.restaurant.text = "\(products[indexPath.row].restaurant)"
            cell.addButton.addTarget(self, action: #selector(addToBasketDidTap), for: .touchUpInside)
        }
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func addToBasketDidTap(){
            if let tabBarController = tabBarControllerRef {
                     let tabBarItem = tabBarController.tabBar.items?[2]
                tabBarItem?.badgeValue = "\(DataManager.shared.basketArray.count)"
                 }
        }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredProducts.removeAll()
        guard searchText != "" || searchText != " " else{return}
        
        for i in products{
            let text = searchText.uppercased()
            let isArrayContain = i.name.uppercased().contains(text)
            
            if isArrayContain != nil{
                filteredProducts.append(i)
            }
        }
        if searchBar.text == ""{
            isSearching = false
            tableView.reloadData()
        }
        else{
            isSearching = true
            filteredProducts = products.filter({$0.name.contains(searchBar.text ?? "")})
            tableView.reloadData()
        }
    }


}
