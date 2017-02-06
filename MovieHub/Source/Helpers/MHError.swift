//
//  MHError.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//


import UIKit

/**
 *  This Struct is used for getting NSError
 */
struct MHError {
    
    //when error in data parsing
    static func getWrongDataError() -> NSError {
        let userInfo: [NSObject : AnyObject] = ["NSLocalizedDescriptionKey" :  NSLocalizedString("WrongData", comment: ""),]
        return NSError(domain: "Unprocessable Entity", code: 422, userInfo: userInfo)
    }
    
    //unauthorized person
    static func getServerError() -> NSError {
        let userInfo: [NSObject : AnyObject] = ["NSLocalizedDescriptionKey" :  NSLocalizedString("Unauthorized", comment: ""),]
        return NSError(domain: "unauthorized", code: 401, userInfo: userInfo)
    }
}



