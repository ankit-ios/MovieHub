//
//  MHConstants.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Foundation

//Notification Constant
let kDateFormatChangeNotification = "DateFormatChangeNotification"
let kMoviesSortNotification = "MovieSortNotification"
let kThemeColorChangeNotification = "ThemeColorChangeNotification"

//Segue Constants
let kDateFormatSettingSegue = "DateFormatSettingSegue"
let kReleaseDateSettingSegue = "ReleaseDateSettingSegue"
let kShowMovieDetailSegue = "ShowMovieDetailSegue"
let kSetttingSegue = "SetttingSegue"

//date format
let kMMMDYYYY = "MMM d, yyyy"
let kYYYYMMD = "yyyy-MM-d"


//Alert message
let kError = "Error"


//enums
//date format(MMM d, yyyy / yyyy-MM-d)
enum MHDateFormat: Int {
    case MDY
    case YMD
}

//sorting movies order
enum MHSortOrder {
    case Ascending
    case Descending
}

//drawer items
enum MHDrawerItem {
    case TopRated
    case Popular
    case Upcoming
    case Setting
    
    //getting item by value
    static func getItem(withValue value: Int) -> MHDrawerItem {
        switch value {
        case 0:
            return .TopRated
        case 1:
            return .Popular
        case 2:
            return .Upcoming
        case 3:
            return .Setting
        default: return .TopRated
        }
    }
    
    //getting value by item
    func getValue(fromItem item: MHDrawerItem) -> Int {
        switch self {
        case .TopRated:
            return 0
        case .Popular:
            return 1
        case .Upcoming:
            return 2
        default:
            return 0
        }
    }
}

