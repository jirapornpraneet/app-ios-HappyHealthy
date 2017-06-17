//
//  foodTableViewCell.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class foodTableViewCell: UITableViewCell {

    @IBOutlet var nameFoodLabel: UILabel!
    @IBOutlet var kcalFoodLabel: UILabel!
    @IBOutlet var detailFoodLabel: UILabel!
    @IBOutlet var unitFoodLabel: UILabel!
    @IBOutlet var iconFoodImage: UIImageView!
    
    var  foodTableViewCell:foodModel?{
        didSet{
            nameFoodLabel.text = foodTableViewCell?.Food_Name
            kcalFoodLabel.text = String(format: "%f", (foodTableViewCell?.Food_Calories)!)
            detailFoodLabel.text = foodTableViewCell?.Food_Detail
            unitFoodLabel.text = foodTableViewCell?.Food_Unit
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
