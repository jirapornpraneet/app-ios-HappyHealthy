//
//  HistoryDiabetesTableViewCell.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryDiabetesTableViewCell: UITableViewCell {

    @IBOutlet var dateHistoryLabel: UILabel!
    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var levelDiabetesLabel: UILabel!
    @IBOutlet var statusDiabetesLabel: UILabel!
    @IBOutlet var iconHistoryImage: UIImageView!
    
    var  HistoryDiabetesTableViewCell:DiabetesTable?{
        didSet{
            dateHistoryLabel.text = HistoryDiabetesTableViewCell?.D_DateTime
            costSugarLabel.text = String(format: "%i",(HistoryDiabetesTableViewCell?.D_CostSugar)!)
            levelDiabetesLabel.text = HistoryDiabetesTableViewCell?.D_Level
            statusDiabetesLabel.text = HistoryDiabetesTableViewCell?.D_Status
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
