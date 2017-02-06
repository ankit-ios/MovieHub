//
//  MHMovieDetailCollectionViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 31/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

/// This cell class used in MHMoviewDetailCollectionView Controller for displaying all images. 
class MHMovieDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var moviePosterImageView: UIImageView!

    //set size of moviePosterImageView
    override func awakeFromNib() {
        moviePosterImageView.frame.size = self.frame.size
    }
    
    ///set poster image to image view
    func setImage(withImage image: UIImage) {
        moviePosterImageView.image = image
    }
}
