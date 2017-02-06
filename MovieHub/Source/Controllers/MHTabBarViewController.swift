//
//  MHTabBarController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

//Custom Tabbar view controller class
class MHTabBarViewController: UITabBarController {
    
    //these properties is static, these are used for traking setting
    static var dateFormat: MHDateFormat = .MDY
    static var sortOrder: MHSortOrder = .Ascending
    static var themeColor: UIColor = UIColor.defaultThemeColor
    
    
    //ViewController life cycle methods
    override func viewWillAppear(animated: Bool) {
        self.tabBar.barTintColor = MHTabBarViewController.themeColor
    }
}

// MARK: - MHSlideMenuControllerDelegate method
extension MHTabBarViewController: MHSlideMenuControllerDelegate {
    
    /**
     Handle when user taps on any drawer items
     
     - parameter item: param for checking which item tapped
     */
    func didTapDrawerItem(withItem item: MHDrawerItem) {
        
        switch item {
            
        case .TopRated, .Popular, .Upcoming:
            selectedIndex = item.getValue(fromItem: item)
        case .Setting:
            performSegueWithIdentifier(kSetttingSegue, sender: nil)
        }
    }
}