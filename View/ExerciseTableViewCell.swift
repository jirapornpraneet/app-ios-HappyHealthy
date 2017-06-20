//
//  ItemMenuCell.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/16/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    @IBOutlet var nameExerciseLabel: UILabel!
    @IBOutlet var kcalExerciseLabel: UILabel!
    @IBOutlet var detailExerciseLabel: UILabel!
    @IBOutlet var iconExerciseImage: UIImageView!
    
    var  ExerciseTableViewCell:ExerciseTable?{
        didSet{
            nameExerciseLabel.text = ExerciseTableViewCell?.Exercise_Name
            kcalExerciseLabel.text = String(format: "%f", (ExerciseTableViewCell?.Exercise_Calories)!)
            detailExerciseLabel.text = ExerciseTableViewCell?.Exercise_Detail
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
