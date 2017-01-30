//
//  MHMovie.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MHMovie {
    
    private struct Keys {
        static let result = "results"
        static let title = "original_title"
        static let releaseDate = "release_date"
        static let overview = "overview"
        static let voteAverage = "vote_average"
    }
    
    let movieTitle: String?
    let movieReleaseDate: String?
    let movieOverview: String?
    let movieVoteAverage: Double?
    
    
    //This initializer is used for parsing the API response
    init(object: [String: AnyObject]) {
        let jsonObject = JSON(object)
        self.movieTitle = jsonObject[Keys.title].string
        self.movieReleaseDate = jsonObject[Keys.releaseDate].string
        self.movieOverview = jsonObject[Keys.overview].string
        self.movieVoteAverage = jsonObject[Keys.voteAverage].double
    }
    
    static func constructModel(data: AnyObject?) -> [MHMovie]? {
        guard let data = data else {return nil}
        
        if let object = JSON(data)[Keys.result].arrayObject {
            var movies = [MHMovie]()
            
            for movie in object {
                movies.append(MHMovie(object: movie as! [String : AnyObject]))
            }
            
            return movies
        }
        return nil
    }
}