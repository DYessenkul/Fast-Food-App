//
//  MenuTableViewCell.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    var product: Products = Products(name: "", price: 0, image: "", restaurant: "")

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


    @IBAction private func addToBasketDidTap(_ sender: UIButton){
        DataManager.shared.basketArray.append(product)
    }


    
}
