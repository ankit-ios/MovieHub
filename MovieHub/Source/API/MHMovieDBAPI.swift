//
//  MHTheMovieDBAPI.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Foundation

/**
 *  Here, we get all APIs.
 */
struct MHMovieDBAPI {
    
    //constants
    private static let baseURL = "https://api.themoviedb.org/3/movie/"
    private static let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    private static let apiKey = "4c989ba3813652e9f29d4dfd44bd34ad"
    private static let pageQuery = "&page="
    private static let ascendingQuery = "&release_date.asc"
    private static let descendingQuery = "&release_date.desc"
    
    //getting movies urls
    private enum MovieURL {
        case TopRated
        case Popular
        case Upcoming
        
        func getURL() -> String {
            switch self {
            case .TopRated:
                return baseURL + "top_rated?api_key=\(apiKey)&language=en-US"
            case .Popular:
                return baseURL + "popular?api_key=\(apiKey)&language=en-US"
            case .Upcoming:
                return baseURL + "upcoming?api_key=\(apiKey)&language=en-US"
            }
        }
    }
    
    //get image url
    static func getImageURLString(withImageName imageName: String) -> String {
        return imageBaseURL + imageName
    }
    
    //get aaray of images urls
    static func getImageArrayURLString(withMovieID movieid: String) -> String {
        return baseURL + movieid + "/images?api_key=\(apiKey)&language=en-US&include_image_language=en,null"
    }
    
    //get top rated movies urls
    static func getTopRatedMoviesURLString() -> String {
        return MovieURL.getURL(.TopRated)()
    }
    
    //get popular movies urls
    static func getPopularMoviesURLString() -> String {
        return MovieURL.getURL(.Popular)()
    }
    
    //get upcoming movies urls
    static func getUpcomingMoviesURLString() -> String {
        return MovieURL.getURL(.Upcoming)()
    }
    
    //get movies url with page
    static func getMoviesURL(string urlString: String, withPage page: Int) -> String {
        return urlString + pageQuery + "\(page)"
    }
}

