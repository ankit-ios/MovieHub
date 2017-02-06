//
//  Extensions+MHUtility.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import Foundation
import MBProgressHUD

//String Extension
//remove duplicates from String and return String
extension String {
    var removeSpace: String {
        return self.stringByReplacingOccurrencesOfString(" ", withString: "+") ?? self
    }
    
    func convertDateFormate(format format: String) -> String {
        let dateformatter = NSDateFormatter()
        
        if let date = NSDateFormatter.dateWithDateFormatter(forString: self) {
            dateformatter.dateFormat = format
            return dateformatter.stringFromDate(date)
        }
        return self
    }
}

//UIColor extension
//default theme color
extension UIColor {
    class var defaultThemeColor: UIColor {
        return UIColor(red: 232/255, green: 65/255, blue: 69/255, alpha: 1.0)
    }
}

//NSCache Extension
//return static cache for storing downloded images
extension NSCache {
    class var sharedInstance: NSCache {
        struct Static {
            static let instance = NSCache()
        }
        return Static.instance
    }
}

//UIStoryboard Extension
//return  main storyboard instance
extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

//UIViewController Extension
//show alert controller with single message
extension UIViewController {
    
    func showAlertWithMessage(title title: String?, message: String?, viewController: UIViewController?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        viewController?.presentViewController(alertController, animated: true, completion: nil)
    }
    
    class func tabbarViewController() -> UIViewController {
        return UIStoryboard.mainStoryBoard().instantiateViewControllerWithIdentifier("TabBarViewController")
    }
    
    class func drawerViewController() -> UIViewController {
        return UIStoryboard.mainStoryBoard().instantiateViewControllerWithIdentifier("DrawerViewController")
    }
    
    class func colorPickerController() -> UIViewController {
        return UIStoryboard.mainStoryBoard().instantiateViewControllerWithIdentifier("ColorPickerController")
    }
}


//NSNotification Extension
//add or remove notifiaction
extension NSNotification {
    class func addObserver(observer observer: AnyObject, selector: Selector, name: String) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    class func removeObserver(name name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(name)
    }
}

//NSDateFormatter
//convert String into NSDate
extension NSDateFormatter {
    class func dateWithDateFormatter(forString string: String) -> NSDate? {
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = kYYYYMMD
        return dateformatter.dateFromString(string)
    }
}

//MBProgressHUD Extension
//Show and hide MBProgressHUD
extension MBProgressHUD {
    class func showHUD(forView view: UIView) {
        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        hud.mode = .Indeterminate
        hud.animationType = .Fade
        hud.contentColor = UIColor.whiteColor()
        hud.bezelView.color = UIColor.blackColor()
        hud.label.text = "Loading..."
    }
    
    class func hideHUD(forView view: UIView) {
        MBProgressHUD.hideHUDForView(view, animated: true)
    }
}

//UITabbarController Extension
//get title for selected tab
extension UITabBarController {
    class func getTitle(forSelectedIndex index: Int) -> String {
        switch index {
        case 0:
            return "TOP RATED"
        case 1:
            return "POPULAR"
        case 2:
            return "UPCOMING"
        default:
            return ""
        }
    }
}




