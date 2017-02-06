////
////  MHMovieDetail.swift
////  MovieHub
////
////  Created by Ankit Sharma on 30/01/17.
////  Copyright © 2017 Robosoft Technology. All rights reserved.
////

import Foundation
import SwiftyJSON

/**
 *  This model is act for creating object, which have related movie poster.
 */
struct MHMoviePoster {
    
    private struct Keys {
        static let posters = "posters"
        static let filePath = "file_path"
    }
    
    //movie poster name
    let moviePoster: String?
    
    //This initializer is used for parsing the API response
    init(object: [String: AnyObject]) {
        let jsonObject = JSON(object)
        self.moviePoster = jsonObject[Keys.filePath].string
    }
    
    ///pass object then get movie poster otherwise nil
    static func constructModel(data: AnyObject?) -> [MHMoviePoster]? {
        guard let data = data else {return nil}
        
        if let object = JSON(data)[Keys.posters].arrayObject {
            var posters = [MHMoviePoster]()
            
            for poster in object {
                posters.append(MHMoviePoster(object: poster as! [String: AnyObject]))
            }
            return posters
        }
        return nil
    }
}