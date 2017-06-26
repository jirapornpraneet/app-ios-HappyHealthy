//
//  HistoryPressureTableViewCell.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryPressureTableViewCell: UITableViewCell {

    @IBOutlet var dateHistoryLabel: UILabel!
    @IBOutlet var costPressureTopLabel: UILabel!
    @IBOutlet var costPressureDownLabel: UILabel!
    @IBOutlet var levelPressureLabel: UILabel!
    @IBOutlet var costHeartLabel: UILabel!
    @IBOutlet var levelHeartLabel: UILabel!
    @IBOutlet var iconHistoryImage: UIImageView!
    
    var  HistoryPressureTableViewCell:PressureTable?{
        didSet{
            dateHistoryLabel.text = HistoryPressureTableViewCell?.P_DateTime
            costPressureTopLabel.text = String(format: "%i",(HistoryPressureTableViewCell?.P_CostPressureTop)!)
            costPressureDownLabel.text = String(format: "%i",(HistoryPressureTableViewCell?.P_CostPressureDown)!)
            costHeartLabel.text = String(format: "%i",(HistoryPressureTableViewCell?.P_HeartRate)!)
            levelPressureLabel.text = HistoryPressureTableViewCell?.P_Pressure_Level
            levelHeartLabel.text = HistoryPressureTableViewCell?.P_HeartRate_Level
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
