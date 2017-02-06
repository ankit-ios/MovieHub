//
//  MHUpcomingMovieViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHUpcomingMovieViewController: MHTabbarBaseViewController {
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        movieURLString = MHMovieDBAPI.getUpcomingMoviesURLString()
        super.viewDidLoad()
    }
}