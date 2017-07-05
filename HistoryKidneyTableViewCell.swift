//
//  HistoryKidneyTableViewCell.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryKidneyTableViewCell: UITableViewCell {

    @IBOutlet var dateHistoryLabel: UILabel!
    @IBOutlet var costGFRLabel: UILabel!
    @IBOutlet var levelCostGFRLabel: UILabel!
    @IBOutlet var iconHistoryImage: UIImageView!
    
    var  HistoryKidneyTableViewCell:KidneyTable?{
        didSet{
            dateHistoryLabel.text = HistoryKidneyTableViewCell?.K_DateTime
            costGFRLabel.text = String(format: "%i",(HistoryKidneyTableViewCell?.K_CostGFR)!)
            levelCostGFRLabel.text = HistoryKidneyTableViewCell?.K_LevelCostGFR
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
