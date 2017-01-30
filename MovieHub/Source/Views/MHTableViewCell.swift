//
//  MHTableViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    func configureCell(with movie: MHMovie) {
        movieTitleLabel.text = movie.movieTitle ?? ""
        releaseDateLabel.text = movie.movieReleaseDate ?? ""
        voteAverageLabel.text = "\((movie.movieVoteAverage ?? 0.0) / 2)"
        movieOverviewLabel.text = movie.movieOverview ?? ""
    }
}
