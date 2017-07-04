//
//  DetailExerciseHistoryTableViewCell.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/4/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class DetailExerciseHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet var nameExerciseLabel: UILabel!
    @IBOutlet var kcalExerciseLabel: UILabel!
    @IBOutlet var amountExerciseLabel: UILabel!
    @IBOutlet var detailExerciseLabel: UILabel!
    @IBOutlet var iconExerciseImage: UIImageView!
    
    var DetailExerciseHistoryTableViewCell:ListExerciseHistory?{
        didSet{
            let amountExercise = String(format: "%.02f", (DetailExerciseHistoryTableViewCell?.Exercise_TotalDuration)!)
            var amountTotalExercise:Double?
            amountTotalExercise = Double(amountExercise)!
            let kcalExercise = String(format: "%.02f", (DetailExerciseHistoryTableViewCell?.Exercise_Calories)!)
            var kcalSum:Double?
            kcalSum = Double(kcalExercise)!
            var totalKcal:Double?
            totalKcal = (amountTotalExercise! * kcalSum!)
            
            nameExerciseLabel.text = DetailExerciseHistoryTableViewCell?.Exercise_Name
            detailExerciseLabel.text = DetailExerciseHistoryTableViewCell?.Exercise_Disease
            amountExerciseLabel.text = String(format: "%.00f", (DetailExerciseHistoryTableViewCell?.Exercise_TotalDuration)!)
            kcalExerciseLabel.text = String(format: "%.00f", (totalKcal)!)

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
