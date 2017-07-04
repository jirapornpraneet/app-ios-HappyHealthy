//
//  DetailFoodHistoryTableViewCell.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/4/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class DetailFoodHistoryTableViewCell: UITableViewCell {
    
    var senderDate:String?
    
    @IBOutlet weak var iconFoodImage: UIView!
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var kcalFoodLabel: UILabel!
    @IBOutlet weak var amountFoodLabel: UILabel!
    @IBOutlet weak var unitFoodLabel: UILabel!
    @IBOutlet weak var detailFoodLabel: UILabel!
    
    var  DetailFoodHistoryTableViewCell:ListFoodHistory?{
        didSet{
            let amountFood = String(format: "%.02f", (DetailFoodHistoryTableViewCell?.Food_TotalAmount)!)
            var amountTotalFood:Double?
            amountTotalFood = Double(amountFood)!
            let kcalFood = String(format: "%.02f", (DetailFoodHistoryTableViewCell?.Food_Calories)!)
            var kcalSum:Double?
            kcalSum = Double(kcalFood)!
            var totalKcal:Double?
            totalKcal = (amountTotalFood! * kcalSum!)

            nameFoodLabel.text = DetailFoodHistoryTableViewCell?.Food_Name
            kcalFoodLabel.text = String(format: "%.00f", (totalKcal)!)
            amountFoodLabel.text = String(format: "%.00f", (DetailFoodHistoryTableViewCell?.Food_TotalAmount)!)
            detailFoodLabel.text = DetailFoodHistoryTableViewCell?.Food_Detail
            unitFoodLabel.text = DetailFoodHistoryTableViewCell?.Food_Unit
            
            
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
