//
//  BasketViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    var tabBarControllerRef: UITabBarController?
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        var total = 0
        for i in DataManager.shared.basketArray{
            total = total + i.price
        }
        totalPrice.text = "$\(total).00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tabBarControllerRef = tabBarController
       
    }
    
    
    @IBAction private func buyButtonDidTap(_ sender: UIButton){
        if !DataManager.shared.basketArray.isEmpty{
            showAlert()
            DataManager.shared.basketArray.removeAll()
            tableView.reloadData()
            var total = 0
            for i in DataManager.shared.basketArray{
                total = total + i.price
            }
            totalPrice.text = "$\(total).00"
            if let tabBarController = tabBarControllerRef {
                     let tabBarItem = tabBarController.tabBar.items?[2]
                tabBarItem?.badgeValue = "0"
                 }
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Successful purchase", message: "Thank you for ordering from us. Your order will arrive within 20-30 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell") as! BasketTableViewCell
        cell.foodName.text = DataManager.shared.basketArray[indexPath.row].name
        cell.foodPrice.text = "$\(DataManager.shared.basketArray[indexPath.row].price).00"
        cell.foodImage.image = UIImage(named: DataManager.shared.basketArray[indexPath.row].image)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DataManager.shared.basketArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            var total = 0
            for i in DataManager.shared.basketArray{
                total = total + i.price
            }
            totalPrice.text = "$\(total).00"
            if let tabBarController = tabBarControllerRef {
                     let tabBarItem = tabBarController.tabBar.items?[2]
                tabBarItem?.badgeValue = "\(DataManager.shared.basketArray.count)"
                 }
        }
        
        
    }

}
