//
//  MHSettingTableViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

/// MHSettingTableViewController table view cell for displaying setting titles
class MHSettingTableViewCell: UITableViewCell {

    @IBOutlet private weak var settingLabel: UILabel!
    
    //configure cell
    func configureCell(withSettingTitle title: String) {
        settingLabel.text = title
    }
}
