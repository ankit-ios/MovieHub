//
//  MHDrawerTableViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

///This is table view cell, which is used in UIDrawerTableViewController for displaying drawer titles and icons
class MHDrawerTableViewCell: UITableViewCell {

    @IBOutlet private weak var drawerItemLabel: UILabel!
    @IBOutlet private weak var drawerItemImageView: UIImageView!
    
    //configure cell
    func configureCell(withMovieType type: String, imageName: String) {
        drawerItemLabel.text = type
        drawerItemImageView.image = UIImage(named: imageName)
    }
}
