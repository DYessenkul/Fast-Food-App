//
//  HomeTableViewCell.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 25.04.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var deliveryTime: UILabel!
    @IBOutlet weak var rating: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantName.layer.shadowColor = UIColor.black.cgColor
        restaurantName.layer.shadowOffset = CGSize(width: 4, height: 4)
        restaurantName.layer.shadowRadius = 5
        restaurantName.layer.shadowOpacity = 0.75
        restaurantImage.layer.opacity = 0.95
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
