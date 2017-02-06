//
//  MHPopularMovieViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHPopularMovieViewController: MHTabbarBaseViewController {
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        movieURLString = MHMovieDBAPI.getPopularMoviesURLString()
        super.viewDidLoad()
    }
}