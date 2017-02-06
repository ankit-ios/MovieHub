//
//  MHTableViewCell.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

///This is table view cell, which is used in MHContainerTableViewController for displaying all movies details
class MHContainerTableViewCell: UITableViewCell {

    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var movieOverviewLabel: UILabel!
    
    //configure cell
    func configureCell(with movie: MHMovie, andDateFormat format: String) {
        movieTitleLabel.text = movie.movieTitle ?? ""
        releaseDateLabel.text = movie.movieReleaseDate?.convertDateFormate(format: format) ?? ""
        voteAverageLabel.text = String(format: "%.1f", (movie.movieVoteAverage ?? 0) / 2)
        movieOverviewLabel.text = movie.movieOverview ?? ""
    }
}
