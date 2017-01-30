//
//  MHDrawerTableViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHDrawerTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var movieTypeImageView: UIImageView!
    
    func configureCell(withMovieType type: String, imageName: String) {
        movieTypeLabel.text = type
        movieTypeImageView.image = UIImage(named: imageName)
    }
}
