//
//  MHNavigationController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 02/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

/// Custom Navigation Controller
class MHNavigationController: UINavigationController {
    
    //theme color for all navigation controller
    static var themeColor: UIColor = UIColor.defaultThemeColor
    
    
    override func viewDidLoad() {
        NSNotification.addObserver(observer: self, selector: #selector(handleThemeColor), name: kThemeColorChangeNotification) //adding observer, for observering bar tint color
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationBar.barTintColor = MHNavigationController.themeColor
    }

    deinit {
        NSNotification.removeObserver(name: kThemeColorChangeNotification)
    }
    
    //change all navigation bar tint color
    func handleThemeColor() {
        navigationBar.barTintColor = MHNavigationController.themeColor
    }
}
