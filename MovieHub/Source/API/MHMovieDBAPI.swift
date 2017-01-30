//
//  MHTheMovieDBAPI.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

struct MHMovieDBAPI {
    
    
    private static let baseURL = "https://api.themoviedb.org/3/movie/"
    private static let apiKey = "4c989ba3813652e9f29d4dfd44bd34ad"
    
    
    private enum MovieURL {
        case TopRated
        case Popular
        case Upcoming
        
        func getURL() -> String {
            switch self {
            case .TopRated:
                return baseURL + "top_rated?api_key=\(apiKey)&language=en-US&page=1"
            case .Popular:
                return baseURL + "popular?api_key=\(apiKey)&language=en-US&page=1"
            case .Upcoming:
                return baseURL + "upcoming?api_key=\(apiKey)&language=en-US&page=1"
            }
        }
    }
    
    static func getImageURLString() -> String {
        return "https://image.tmdb.org/t/p/w500/xBKGJQsAIeweesB79KC89FpBrVr.jpg"
    }
    
    static func getTopRatedMoviesURLString() -> String {
        return MovieURL.getURL(.TopRated)()
    }
    
    static func getPopularMoviesURLString() -> String {
        return MovieURL.getURL(.Popular)()
    }
    
    static func getUpcomingMoviesURLString() -> String {
        return MovieURL.getURL(.Upcoming)()
    }
    
    static func getImageWithDescriptionURLString() -> String {
        return baseURL + "369557?api_key=\(apiKey)&language=en-US&append_to_response=images&include_image_language=en,null"
    }
}

