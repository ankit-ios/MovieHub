//
//  MHTabBarTableViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHTabBarViewController: UITabBarController {
    
    static var selectedTab: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = MHTabBarViewController.selectedTab
        
//        let selectedColor   = UIColor.whiteColor()
//        let unselectedColor = UIColor(red: 240.0/255.0, green: 146.0/255.0, blue: 146.0/255.0, alpha: 1.0)
//        
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: unselectedColor], forState: .Normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], forState: .Selected)
    }
    
    func showDrawerViewController() {
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("MHDrawerViewController") as! MHDrawerViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    class func getInstance(selectedTab: Int) -> MHTabBarViewController {
        self.selectedTab = selectedTab
        return MHTabBarViewController()
    }
}
