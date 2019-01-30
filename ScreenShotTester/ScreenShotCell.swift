//
//  ScreenShotTableViewCell.swift
//  ScreenShotTester
//
//  Created by Admin on 1/29/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import UIKit

class ScreenShotCell: UITableViewCell {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
