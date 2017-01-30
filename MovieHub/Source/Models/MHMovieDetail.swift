////
////  MHMovieDetail.swift
////  MovieHub
////
////  Created by Ankit Sharma on 30/01/17.
////  Copyright © 2017 Robosoft Technology. All rights reserved.
////
//
//import Foundation
//import SwiftyJSON
//
//struct MHMovieDetail {
//    
//    private struct Keys {
//        static let title = "original_title"
//        static let overview = "overview"
//        static let images = "images"
//        static let backDrops = "backdrops"
//        static let filePath = "file_path"
//    }
//    
//    let movieTitle: String?
//    let movieOverview: String?
//    let movieImages: [String]?
//    
//    
//    //This initializer is used for parsing the API response
//    init(object: [String: AnyObject]) {
//        let jsonObject = JSON(object)
//        self.movieTitle = 
//    }
//    
//    static func constructModel(data: AnyObject?) -> [MHMovie]? {
//        guard let data = data else {return nil}
//        
////        if let object = JSON(data)[Keys.result].arrayObject {
////            var movies = [MHMovie]()
////            
////            for movie in object {
////                movies.append(MHMovie(object: movie as! [String : AnyObject]))
////            }
////            
////            return movies
////        }
//        return nil
//    }
//}