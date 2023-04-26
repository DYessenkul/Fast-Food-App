//
//  TabBarViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    static let storyboardIdentifier = "TabBarViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func updateBadgeValue(value: Int){
        if let tabBarItem = self.tabBar.items?[2]{
            tabBarItem.badgeValue = "\(value)" 
        }
    }
 

 

}
