//
//  MHMovie.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Foundation
import SwiftyJSON

/// This model is act for creating object of Movie, which have all required details.
class MHMovie {
    
    private struct Keys {
        static let id = "id"
        static let result = "results"
        static let title = "original_title"
        static let releaseDate = "release_date"
        static let overview = "overview"
        static let voteAverage = "vote_average"
    }
    
    //all properties is optional type, because we don't know about api response, it might be nil
    let movieID: Int?
    let movieTitle: String?
    let movieReleaseDate: String?
    let movieOverview: String?
    let movieVoteAverage: Double?
    
    //This initializer is used for parsing the API response
    init(object: [String: AnyObject]) {
        let jsonObject = JSON(object)
        self.movieID = jsonObject[Keys.id].int
        self.movieTitle = jsonObject[Keys.title].string
        self.movieReleaseDate = jsonObject[Keys.releaseDate].string
        self.movieOverview = jsonObject[Keys.overview].string
        self.movieVoteAverage = jsonObject[Keys.voteAverage].double
    }
    
    ///pass any object, if possible then get array of movies otherwise nil
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