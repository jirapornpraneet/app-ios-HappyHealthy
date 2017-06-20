//
//  foodTableViewCell.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet var nameFoodLabel: UILabel!
    @IBOutlet var kcalFoodLabel: UILabel!
    @IBOutlet var detailFoodLabel: UILabel!
    @IBOutlet var unitFoodLabel: UILabel!
    @IBOutlet var iconFoodImage: UIImageView!
    
    var  FoodTableViewCell:FoodTable?{
        didSet{
            nameFoodLabel.text = FoodTableViewCell?.Food_Name
            kcalFoodLabel.text = String(format: "%f", (FoodTableViewCell?.Food_Calories)!)
            detailFoodLabel.text = FoodTableViewCell?.Food_Detail
            unitFoodLabel.text = FoodTableViewCell?.Food_Unit
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
