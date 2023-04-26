//
//  MenuViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    static let storyboardIdentifier = "MenuViewController"
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var tabBarControllerRef: UITabBarController?
    var restName = ""
    
    var products = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        tabBarControllerRef = tabBarController
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.restaurantName.text = self.restName
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.product = products[indexPath.row]
        cell.foodName.text = products[indexPath.row].name
        cell.foodImage.image = UIImage(named: products[indexPath.row].image)
        cell.foodPrice.text = "$\(products[indexPath.row].price).00"
        cell.addButton.addTarget(self, action: #selector(addToBasketDidTap), for: .touchUpInside)
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

}
