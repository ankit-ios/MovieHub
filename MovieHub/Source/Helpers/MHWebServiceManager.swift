//
//  MHWebServiceManager.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Alamofire
import SwiftyJSON

/**
 *  This MHWebServiceManager is act for handling all network requests and responses.
 */
struct MHWebServiceManager {
    
    typealias completionHandlerForJSON = (response: AnyObject?, error: NSError?) -> Void
    typealias completionHandlerForData = (response: NSData?, error: NSError?) -> Void
    
    /**
     get movies details
     
     - parameter urlString:    url String
     - parameter onCompletion: get movies details in array and error
     */
    static func getMovieDetail(with urlString: String, onCompletion: (response: [MHMovie]?, error: NSError?) -> Void) {
        
        makeHTTPGetRequestForJSON(urlString.removeSpace) { response, error in
            
            if let response = response where error == nil {
                if let movies = MHMovie.constructModel(response) {
                    onCompletion(response: movies, error: nil)
                }
                else {
                    onCompletion(response: nil, error: MHError.getWrongDataError())
                }
            } else {
                onCompletion(response: nil, error: error)
            }
        }
    }
    
    /**
     get movie posters
     
     - parameter urlString:    url String
     - parameter onCompletion: get movie posters and error
     */
    static func getMoviePosters(with urlString: String, onCompletion: (response: [MHMoviePoster]?, error: NSError?) -> Void) {
        
        makeHTTPGetRequestForJSON(urlString.removeSpace) { response, error in
            
            if let response = response where error == nil {
                if let posters = MHMoviePoster.constructModel(response) {
                    onCompletion(response: posters, error: nil)
                }
                else {
                    onCompletion(response: nil, error: MHError.getWrongDataError())
                }
            } else {
                onCompletion(response: nil, error: error)
            }
        }
    }

    /**
     get Image
     
     - parameter urlString:    url String
     - parameter onCompletion: get UIImage and error
     */
    static func getImage(with urlString: String, onCompletion: (response: UIImage?, error: NSError?) -> Void) {
        makeHTTPGetRequestForData(urlString.removeSpace) { response, error in
            
            if let response = response where error == nil {
                onCompletion(response: UIImage(data: response), error: nil)
            } else {
                onCompletion(response: nil, error: error)
            }
        }
    }
    
    /**
     make request for getting response in json format
     
     - parameter path:         url for getting json data
     - parameter onCompletion: return response in json format
     */
    static func makeHTTPGetRequestForJSON(path: String, onCompletion: completionHandlerForJSON) {
        
        Alamofire.request(.GET, path).responseJSON { (request, response, result) in
            
            switch result {
            case .Success(let value):
                onCompletion(response: value, error: nil)
            case .Failure(_, let error):
                onCompletion(response: nil, error: error as? NSError ?? MHError.getServerError())
            }
        }
    }
    
    /**
     make request for getting response in data format
     
     - parameter urlString:    url for getting reponse in data format
     - parameter onCompletion: return response
     */
    static func makeHTTPGetRequestForData(urlString: String, onCompletion: (completionHandlerForData)) {
        
        Alamofire.request(.GET, urlString).responseData { (request, respose, result) in
            
            switch result {
            case .Success(let value):
                onCompletion(response: value, error: nil)
            case .Failure(_, let error):
                onCompletion(response: nil, error: error as? NSError ?? MHError.getServerError())
            }
        }
    }
}



